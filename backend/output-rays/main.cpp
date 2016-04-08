#include <iostream>
#include <string>
#include "../../dist/include/jsoncpp/json.h"
#include <ctime>
#include <cstdlib>
#include <math.h>

//JUST FOR DEBUGGING TAKE ME OUT PLEASE
#include <stdio.h>

using namespace std;

void print_vector3 (float * vector, string name) {
  cout << "testing " << name
  <<endl;

  for (int i = 0; i < 3; i++) {
      printf("%lf\n", vector[i]);
  }

  printf("\n");
}

#define NUMBER_OF_RAYS 1
#define MAXIMUM_REFLECTIONS 10

#define crossProduct(a,b,c) \
  (a)[0] = (b)[1] * (c)[2] - (c)[1] * (b)[2]; \
  (a)[1] = (b)[2] * (c)[0] - (c)[2] * (b)[0]; \
  (a)[2] = (b)[0] * (c)[1] - (c)[0] * (b)[1];

#define innerProduct(v,q) \
  ((v)[0] * (q)[0] + \
  (v)[1] * (q)[1] + \
  (v)[2] * (q)[2])

#define vector(a,b,c) \
  (a)[0] = (b)[0] - (c)[0]; \
  (a)[1] = (b)[1] - (c)[1]; \
  (a)[2] = (b)[2] - (c)[2];

void reflect_ray(float *direction, float *normal, float *new_direction) {
  float direction_dot_normal = innerProduct(direction, normal);

  new_direction[0] = 2 * (direction_dot_normal * normal[0]) - 1;
  new_direction[1] = 2 * (direction_dot_normal * normal[1]) - 1;
  new_direction[2] = 2 * (direction_dot_normal * normal[2]) - 1;
}

float vector_length(float *vector) {
  return sqrt(vector[0] * vector[0] + vector[1] * vector[1] + vector[2] * vector[2]);
}

void normalize_vector(float *vector) {
  float length = vector_length(vector);
  vector[0] /= length;
  vector[1] /= length;
  vector[2] /= length;
}

int rayIntersectsTriangle(float *p, float *d, float *v0, float *v1, float *v2) {
  float e1[3],e2[3],h[3],s[3],q[3];
  float a,f,u,v,t;
  vector(e1,v1,v0);
  vector(e2,v2,v0);

  crossProduct(h,d,e2);
  a = innerProduct(e1,h);

  if (a > -0.00001 && a < 0.00001) return false;

  f = 1/a;
  vector(s,p,v0);
  u = f * (innerProduct(s,h));

  if (u < 0.0 || u > 1.0) return false;

  crossProduct(q,s,e1);
  v = f * innerProduct(d,q);

  if (v < 0.0 || u + v > 1.0) return false;

  t = f * innerProduct(e2,q);

  if (t > 0.00001) return true;

  else return false;
}

//parsing mesh
//Mesh has to have no whitespace and escaped quotation marks
Json::Value parse_mesh(string mesh) {
  Json::Value root;
  Json::Reader reader;
  bool parsedSuccess = reader.parse(mesh, root, false);

  if(not parsedSuccess) {
    cout<<"Failed to parse JSON"<<endl
      <<reader.getFormatedErrorMessages()
      <<endl;
  }

  return root;
}

void run_simulation(float *listener_position, string mesh) {
  Json::Value parsed_mesh = parse_mesh(mesh);
  const Json::Value vertices = parsed_mesh["vertices"];
  const Json::Value faces = parsed_mesh["faces"];

  float position[3] = {
    listener_position[0],
    listener_position[1],
    listener_position[2]
  };

  float direction[3] = {
    0,
    0,
    0
  };

  for (int k = 0; k < NUMBER_OF_RAYS; k++) {
    int bounces = 0;

    direction[0] = (static_cast<float>(rand())/static_cast<float>(RAND_MAX)) * 2.0f - 1.0f;
    direction[1] = (static_cast<float>(rand())/static_cast<float>(RAND_MAX)) * 2.0f - 1.0f;
    direction[2] = (static_cast<float>(rand())/static_cast<float>(RAND_MAX)) * 2.0f - 1.0f;



    while (bounces < MAXIMUM_REFLECTIONS) {

      for (unsigned int i=0; i < faces.size(); i++) {
        Json::Value face = faces[i];

        float v0[3] = {
          vertices[face[0].asUInt()][0].asFloat(),
          vertices[face[0].asUInt()][1].asFloat(),
          vertices[face[0].asUInt()][2].asFloat()
        };

        float v1[3] = {
          vertices[face[1].asUInt()][0].asFloat(),
          vertices[face[1].asUInt()][1].asFloat(),
          vertices[face[1].asUInt()][2].asFloat()
        };

        float v2[3] = {
          vertices[face[2].asUInt()][0].asFloat(),
          vertices[face[2].asUInt()][1].asFloat(),
          vertices[face[2].asUInt()][2].asFloat()
        };

        int intersects = rayIntersectsTriangle(position, direction, v0, v1, v2);

        //reflect if intersection
        if (intersects) {
          cout << "Intersects with face " << i
          << endl;

          float new_direction[3] = {0, 0, 0};

          //figuring out normal
          //TODO: process the mesh and create a buffer of normals to reuse in ray intersects mesh function
          float normal[3] = {0, 0, 0};
          float e1[3], e2[3];
          vector(e1, v1, v0);
          vector(e2, v2, v0);
          crossProduct(normal, e1, e2);
          normalize_vector(normal);

          reflect_ray(direction, normal, new_direction);

          direction[0] = new_direction[0];
          direction[1] = new_direction[1];
          direction[2] = new_direction[2];

          bounces++;
        }
      }

    }


  }

}

int main(int argc, char* argv[]) {
  string mesh = argv[1];

  srand(time(0));

  float startingPosition[3] = {
    0.0f,
    0.0f,
    0.0f
  };

  run_simulation(startingPosition, mesh);

  return 0;
}
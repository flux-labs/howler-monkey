#include <iostream>
#include <string>
#include "../../dist/include/jsoncpp/json.h"
#include <ctime>
#include <cstdlib>

//JUST FOR DEBUGGING TAKE ME OUT PLEASE
#include <sstream>

using namespace std;

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
void parse_mesh(string mesh) {
  Json::Value root;
  Json::Reader reader;
  bool parsedSuccess = reader.parse(mesh, root, false);

  if(not parsedSuccess) {
    cout<<"Failed to parse JSON"<<endl
      <<reader.getFormatedErrorMessages()
      <<endl;
  }

  const Json::Value faces = root["faces"];
  const Json::Value vertices = root["vertices"];

  for(unsigned int i=0; i < faces.size(); i++) {
      Json::Value face = faces[i];
      cout << "Face " << i << " in mesh: "
      << face[0].asString()
      << ", "
      << face[1].asString()
      << ", "
      << face[2].asString()
      << endl;
  }

  for(unsigned int i=0; i < vertices.size(); i++) {
      Json::Value vertex = vertices[i];
      cout << "Vertex " << i << " in mesh: "
      << vertex[0].asString()
      << ", "
      << vertex[1].asString()
      << ", "
      << vertex[2].asString()
      << endl;
  }
}

int main(int argc, char* argv[])
{
  string mesh = argv[1];
  parse_mesh(mesh);

  srand(time(0));

  float randomDirection[3] = {
    static_cast<float>(rand())/static_cast<float>(RAND_MAX),
    static_cast<float>(rand())/static_cast<float>(RAND_MAX),
    static_cast<float>(rand())/static_cast<float>(RAND_MAX)
  };

  stringstream ss (stringstream::in | stringstream::out);

  ss << randomDirection[0];
  string floats = ss.str();

  cout << "random direction: "
  << floats
  << endl;

  return 0;
}
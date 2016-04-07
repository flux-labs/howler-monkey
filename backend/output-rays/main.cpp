#include <iostream>
#include <string>
#include "../../dist/include/jsoncpp/json.h"

using namespace std;

int main(int argc, char* argv[])
{
  //parsing mesh
  //Mesh has to have no whitespace and escaped quotation marks
  string mesh = argv[1];

  Json::Value root;
  Json::Reader reader;
  bool parsedSuccess = reader.parse(mesh, root, false);

  if(not parsedSuccess) {
    cout<<"Failed to parse JSON"<<endl
      <<reader.getFormatedErrorMessages()
      <<endl;
    return 1;
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

  return 0;
}
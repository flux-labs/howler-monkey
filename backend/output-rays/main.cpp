#include <iostream>
#include <cstdio>
#include <cstring>
#include "../../dist/include/jsoncpp/json.h"

using namespace std;

int main(int argc, char* argv[])
{
  //parsing mesh
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

  for(unsigned int i=0; i < faces.size(); i++) {
      Json::Value face = faces[i];
      cout << "Face " << i << " in array: "
      << face[0].asString()
      << ", "
      << face[1].asString()
      << ", "
      << face[2].asString()
      << endl;
  }

  return 0;
}
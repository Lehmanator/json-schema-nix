{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "jsonschemas-schemastore";
  version = "unstable-2024-02-29";

  src = fetchFromGitHub {
    owner = "SchemaStore";
    repo = "schemastore";
    rev = "feba3a093aaf1249e43e976b186589b5d3afa162";
    hash = "sha256-OI6bBciAvjozMlhzx0HAShXDr/hI/vCw4+UNXr7U3SA=";
  };

  phases = ["unpackPhase" "installPhase"];

  installPhase = ''
    mkdir $out
    cp $src/src/schemas/json/*.json $out
  '';


  meta = with lib; {
    description = "A collection of JSON schema files including full API";
    homepage = "https://github.com/SchemaStore/schemastore";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    mainProgram = "jsonschemas-schemastore";
    platforms = platforms.all;
  };
}

{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "jsonschema-spec";
  version = "2020-12";

  src = fetchFromGitHub {
    owner = "json-schema-org";
    repo = "json-schema-spec";
    rev = "f8967bcbc6cee27753046f63024b55336a9b1b54";
    hash = "sha256-xUCkNND2QACa4Pdx43kRsy86D5BAtMgG8rTKqdkffAg=";
  };

  phases = ["unpackPhase" "installPhase"];

  installPhase = ''cat $src/schema.json > $out'';

  meta = with lib; {
    description = "The JSON Schema specification";
    homepage = "https://github.com/json-schema-org/json-schema-spec";
    license = licenses.afl3;
    maintainers = with maintainers; [ ];
    mainProgram = "jsonschema-spec";
    platforms = platforms.all;
  };
}

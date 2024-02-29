{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "jsonschema-jsonresume";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "jsonresume";
    repo = "resume-schema";
    rev = "v${version}";
    hash = "sha256-DEY1JmP4EWb85w5NLl+FUvzWlpLgzE8Im7HUdsr1w9M=";
  };

  phases = ["unpackPhase" "installPhase"];

  installPhase = ''cat $src/schema.json > $out'';

  meta = with lib; {
    description = "JSON-Schema is used here to define and validate our proposed resume json";
    homepage = "https://github.com/jsonresume/resume-schema";
    changelog = "https://github.com/jsonresume/resume-schema/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "jsonschema-jsonresume";
    platforms = platforms.all;
  };
}

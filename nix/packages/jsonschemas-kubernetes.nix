{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "jsonschemas-kubernetes";
  version = "unstable-2024-02-21";

  src = fetchFromGitHub {
    owner = "yannh";
    repo = "kubernetes-json-schema";
    rev = "b21b5fc193af54c09295e3572ef21cc76baa0c6b";
    hash = "sha256-UaRsbn5mIeSrMLSE5KAQwCnWaKTx2Ddwn3bulAG5wmM=";
  };

  phases = ["unpackPhase" "installPhase"];

  installPhase = let
    k8s-version = "v1.29.2";
    variants = ["local" "standalone" "standalone-strict"];
  in ''
    mkdir $out
    cp $src/${k8s-version}/*.json $out
  '';

  meta = with lib; {
    description = "JSON Schemas for every version of every object in every version of Kubernetes";
    homepage = "https://github.com/yannh/kubernetes-json-schema/";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    mainProgram = "jsonschemas-kubernetes";
    platforms = platforms.all;
  };
}

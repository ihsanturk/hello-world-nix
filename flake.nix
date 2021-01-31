{
	description = "Hello world, in c";

	inputs.nixpkgs.url = "github:NixOS/nixpkgs";

	outputs = { self, nixpkgs }: {
		defaultPackage.x86_64-linux =
			with import nixpkgs { system = "x86_64-linux"; };
			stdenv.mkDerivation {
				name = "hello";
				src = self;
				buildPhase = "cc -o hello ./hello.c";
				installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
			};
		defaultPackage.x86_64-darwin =
			with import nixpkgs { system = "x86_64-darwin"; };
			stdenv.mkDerivation {
				name = "hello";
				src = self;
				buildPhase = "cc -o hello ./hello.c";
				installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
			};
	};
}

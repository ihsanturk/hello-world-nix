{
	description = "hello world, c";

	inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

	outputs = { self, nixpkgs }: {
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

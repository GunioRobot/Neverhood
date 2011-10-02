#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <stdio.h>
#include "SDL.h"

SDL_Surface* NHC_IMG_Load(const char* filename, int mirror) {
	printf("\n\n%s\n\n", filename);
	SDL_Surface* surface = SDL_CreateRGBSurface(SDL_SWSURFACE, 1, 1, 8, 0, 0, 0, 0);
	return surface;
}

MODULE = Games::Neverhood::Image		PACKAGE = Games::Neverhood::Image		PREFIX = Neverhood_Image_

SDL_Surface*
Neverhood_Image_load(filename, mirror)
		char* filename
		int mirror
	PREINIT:
		char* CLASS = "SDL::Surface";
	CODE:
		RETVAL = NHC_IMG_Load(filename, mirror);
	OUTPUT:
		RETVAL

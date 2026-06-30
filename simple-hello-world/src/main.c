#include <SDL3/SDL.h>
#include <SDL3/SDL_error.h>
#include <SDL3/SDL_events.h>
#include <SDL3/SDL_video.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if (!SDL_Init(SDL_INIT_VIDEO))
    {
        fprintf(stderr, "Failed to initialize SDL: %s\n", SDL_GetError());
        return EXIT_FAILURE;
    }

    SDL_Window *window = SDL_CreateWindow("Hello!", 1024, 768, SDL_WINDOW_HIGH_PIXEL_DENSITY);

    if (window == NULL)
    {
        fprintf(stderr, "Failed to create window: %s\n", SDL_GetError());
        return EXIT_FAILURE;
    }

    bool running = true;
    SDL_Event event;
    while (running)
    {
        while (SDL_PollEvent(&event))
        {
            switch (event.type)
            {
            case SDL_EVENT_QUIT:
                running = false;
                break;
            default:
                break;
            }
        }
        SDL_Delay(100);
    }

    SDL_Quit();

    return EXIT_SUCCESS;
}

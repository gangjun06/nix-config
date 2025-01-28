#include "../sketchybar.h"
#include <CoreFoundation/CoreFoundation.h>
#include <strings.h>
#include <time.h>

const char *command =
    "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist "
    "AppleSelectedInputSources | egrep -w 'Input Mode' | sed -E 's/.+ = "
    "\"?([^\"]+)\"?;/\\1/' | head -n 1";

int main(int argc, char **argv) {
  float update_freq;
  if (argc < 3 || (sscanf(argv[2], "%f", &update_freq) != 1)) {
    printf("Usage: %s \"<event-name>\" \"<event_freq>\"\n", argv[0]);
    exit(1);
  }

  char *event_name = argv[1];

  alarm(0);

  // Setup the event in sketchybar
  char event_message[512];
  snprintf(event_message, 512, "--add event '%s'", event_name);
  sketchybar(event_message);

  char trigger_message[512];
  char last_output[256] = {0};

  for (;;) {
    // Wait
    usleep(update_freq * 1000000);

    FILE *fp;
    char output[256] = {0};

    fp = popen(command, "r");
    if (fp == NULL) {
      exit(1);
    }

    fread(output, 1, sizeof(output) - 1, fp);
    pclose(fp);

    if (strcmp(last_output, output) == 0) {
      continue;
    }

    strcpy(last_output, output);

    snprintf(trigger_message, 512, "--trigger '%s' method='%s'", event_name,
             output);

    // Trigger the event
    sketchybar(trigger_message);
  }
  return 0;
}

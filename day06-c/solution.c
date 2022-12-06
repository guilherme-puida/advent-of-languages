#include <stdio.h>
#include <stdbool.h>

bool are_all_different(char *recent, int n) {
  for (int i = 0; i < n; ++i) {
    for (int j = i+1; j < n; ++j) {
      if (recent[i] == recent[j]) return false;
    }
  }
  
  return true;
}

int main(void) {
  char recent4[4], recent14[14];
  
  bool p1_done = false;
  
  for (int i = 0; ;i++) {
    char c = getchar();
    
    recent4[i % 4] = c;
    recent14[i % 14] = c;
    
    if (i > 3 && !p1_done && are_all_different(recent4, 4)) {
      printf("Part 1: %d\n", i + 1);
      p1_done = true;
    }
    
    if (i > 13 && are_all_different(recent14, 14)) {
      printf("Part 2: %d\n", i + 1);
      break;
    }
  }
  
  return 0;
}

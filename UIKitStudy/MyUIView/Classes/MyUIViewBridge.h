
#include <stdio.h>

class MyViewBridge
{
public:
    static MyViewBridge* instance();
    void showMyView();
    void purgeMyView();
};
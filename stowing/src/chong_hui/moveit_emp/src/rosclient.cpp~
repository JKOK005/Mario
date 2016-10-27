/**
    Simple TCP client to fetch a web page
    Silver Moon (m00n.silv3r@gmail.com)
*/
 
#include<stdio.h> //printf
#include<string.h>    //strlen
#include<sys/socket.h>    //socket
#include<arpa/inet.h> //inet_addr
#include<unistd.h>    //usleep
#include<fcntl.h> //fcntl
#include <sys/time.h>
#include <sstream>
 
//Size of each chunk of data received, try changing this
#define CHUNK_SIZE 512

// Define struct 
struct point_data
{ 
  double jointvalue[7];
  char flag[6];
} pointdata;

int pNum=14;

struct path_data
{
  int pointsNum;
  double DoubleArray[14];
  char flag[3];
};
 
//Receiving function
int recv_timeout(int s, int timeout);
 
int main(int argc , char *argv[])
{
    int socket_desc;
    struct sockaddr_in server;
    char *message , server_reply[2000];
     
    //Create socket
    socket_desc = socket(AF_INET , SOCK_STREAM , 0);
    if (socket_desc == -1)
    {
        printf("Could not create socket");
    }
     
    //ip address of www.msn.com (get by doing a ping www.msn.com at terminal)
    server.sin_addr.s_addr = inet_addr("172.16.28.106");
    server.sin_family = AF_INET;
    server.sin_port = htons( 11002 );
 
    //Connect to remote server
    if (connect(socket_desc , (struct sockaddr *)&server , sizeof(server)) < 0)
    {
        puts("connect error");
        return 1;
    }
     
    puts("Connected\n");

    ////Now receive full data (String)
    //int total_recv = recv_timeout(socket_desc, 4);
    //printf("\n\nDone. Received a total of %d bytes\n\n" , total_recv);
/*
    //// receive double array
    double jointvalue[7];
    if( recv(socket_desc, &jointvalue, sizeof(jointvalue), 0) < 0)
    {
        puts("Receive failed");
        return 1;
    }
    else
    {
        for(int i=0;i<7;i++)
               printf("%f\n" , jointvalue[i]);
        //publish jointvalue and robot_synchronize
    }
*/
    //// receive struct data with double array and string flag
    struct point_data jointdata;
    int byterec = recv(socket_desc, &jointdata, sizeof(jointdata), 0);
    if( byterec < 0)
    {
        puts("Receive failed");
        return 1;
    }
    else
    {
        printf("\n%d\n" , byterec);
        for(int i=0;i<7;i++)
               printf("%f\n" , jointdata.jointvalue[i]);
        printf("%s\n",jointdata.flag);
        //publish jointvalue and robot_synchronize
    }
    
    if (jointdata.flag=="END")
    {
      printf("YES");
    }

     
    //Send some data
    //subscribe planned trajectory to DoubleArrray and points number to int pointNum 
/*
    ////send string data
    message = "END";
    //printf("%s" , message);
    int l_m = send(socket_desc , message , strlen(message) , 0);
    if( l_m < 0)
    {
        puts("Send failed");
        return 1;
    }
    else
    {
       printf("%d" , l_m);   
    }
    puts("String data Send\n");
*/

    // send the number of points
    int pointNum = 4;
    int bytesendN = send(socket_desc, &pointNum, sizeof(pointNum), 0);

    if( bytesendN < 0)
    {
        puts("Send failed");
        return 1;
    }
    else
    {
      printf("\n%d\n" , bytesendN);
    }
    puts("Points number Send\n");

    ////send double array
    //int pointNum = 2;
    double DoubleArray[] ={1.2,2.2,3.2,4.2,5.2,6.2,7.2,1.8,2.8,3.8,4.8,5.8,6.8,7.8,1.2,2.2,3.2,4.2,5.2,6.2,7.2,1.8,2.8,3.8,4.8,5.8,6.8,7.8};

   int bytesend = send(socket_desc, &DoubleArray, sizeof(DoubleArray), 0);

    if( bytesend < 0)
    {
        puts("Send failed");
        return 1;
    }
    else
    {
      printf("\n%d\n" , bytesend);
    }
    puts("Double array data Send\n");

/*
    //send struct data with double array and string flag
    struct path_data pathpoints;
    pathpoints.pointsNum = 2;
    strcpy(pathpoints.flag, "END");

    double pointarray[] = {1.2,2.2,3.2,4.2,5.2,6.2,7.2,1.8,2.8,3.8,4.8,5.8,6.8,7.8};
    for (int i=0; i < 7*pathpoints.pointsNum; i++) 
    {
        pathpoints.DoubleArray[i]=pointarray[i];

    }  

    int nb_send = send(socket_desc, &pathpoints, sizeof(pathpoints), 0);

    if( nb_send < 0)
    {
        puts("Send failed");
        return 1;
    }
    else
    {
        printf("\n%d\n" , nb_send);
    }
    puts("Struct data Send\n");
*/
/*
    ////send double data
    double MyDouble = 20.55987;
    if( send(socket_desc, &MyDouble, sizeof(MyDouble), 0) < 0)
    {
        puts("Send failed");
        return 1;
    }
    puts("Data Send\n");
*/
    
    return 0;
}
 
/*
    Receive data in multiple chunks by checking a non-blocking socket
    Timeout in seconds
*/

// receive string
int recv_timeout(int s , int timeout)
{
    int size_recv , total_size= 0;
    struct timeval begin , now;
    char chunk[CHUNK_SIZE];
    double timediff;
     
    //make socket non blocking
    fcntl(s, F_SETFL, O_NONBLOCK);
     
    //beginning time
    gettimeofday(&begin , NULL);
     
    while(1)
    {
        gettimeofday(&now , NULL);
         
        //time elapsed in seconds
        timediff = (now.tv_sec - begin.tv_sec) + 1e-6 * (now.tv_usec - begin.tv_usec);
         
        //if you got some data, then break after timeout
        if( total_size > 0 && timediff > timeout )
        {
            break;
        }
         
        //if you got no data at all, wait a little longer, twice the timeout
        else if( timediff > timeout*2)
        {
            break;
        }
         
        memset(chunk ,0 , CHUNK_SIZE);  //clear the variable
        if((size_recv =  recv(s , chunk , CHUNK_SIZE , 0) ) < 0)
        {
            //if nothing was received then we want to wait a little before trying again, 0.1 seconds
            usleep(100000);
        }
        else
        {
            total_size += size_recv;
            printf("%s" , chunk);
            //reset beginning time
            gettimeofday(&begin , NULL);
        }
    }
     
    return total_size;
}

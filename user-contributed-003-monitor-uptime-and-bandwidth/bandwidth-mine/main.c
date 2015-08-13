//
//  main.c
//  bandwidth-mine
//

//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <net/if.h>
#include <ifaddrs.h>



const char * IFACE_CODE = "tun0";
// network traffic will be measured on tun0 which is just  the VPN traffic and is all I care about. This can be changed to en1, en2 or whatever.

char * format_bytes(char * buffer, uint64_t bytes)
{
	
		sprintf(buffer, "%.3Lg MB", ((long double)bytes) / 1048576.0);
	
	return buffer;
}

int main()
{
	uint64_t last_in = 0;
	uint64_t last_out = 0;
	
    
    struct ifaddrs *ifa_list = 0, *ifa;
    
    if(getifaddrs(&ifa_list) == -1)
    {
        freeifaddrs(ifa_list);
       
    }
    
    for(ifa = ifa_list; ifa; ifa = ifa->ifa_next)
    {
        if(AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        if(!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            continue;
        if(ifa->ifa_data == 0)
            continue;
        
        if(strcmp(IFACE_CODE, ifa->ifa_name) == 0)
        {
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            
            uint64_t in_packets = if_data->ifi_ipackets;
            uint64_t out_packets = if_data->ifi_opackets;
            uint64_t in_bytes = if_data->ifi_ibytes;
            uint64_t out_bytes = if_data->ifi_obytes;
            
            uint64_t net_in = 0;
            if(last_in > 0)
                net_in = in_bytes - last_in;
            
            uint64_t net_out = 0;
            if(last_out > 0)
                net_out = out_bytes - last_out;
            
            last_in = in_bytes;
            last_out = out_bytes;
            
            char buffer1[50], buffer2[50];
            //printf("Packets: in = %llu, out = %llu\n", in_packets, out_packets);
            printf("Bytes: in = %s, out = %s\n", format_bytes(buffer1, in_bytes), format_bytes(buffer2, out_bytes));
            //printf("Bandwidth: in = %s/s, out = %s/s\n", format_bytes(buffer1, net_in), format_bytes(buffer2, net_out));
           // printf("\n");
            
           
        }
    }
    
    if(ifa_list)
        freeifaddrs(ifa_list);
    
	
}

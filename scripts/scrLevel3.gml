//---------------------------------------------------LEVEL3---------------------------------------------------
if keyboard_string = ">motd"
    {
       scrText(scrColorflag(c_white)+"
 You neeed move to another computer to use databse.
 Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"ssh wilterk "+scrEndColorflag()+
        scrColorflag(c_white)+"to move to wilterk´s computer "+scrEndColorflag()+ "

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
else if keyboard_string = ">help"
    {
        scrText(scrColorflag(c_yellow)+"
        motd"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display the last system message"+scrEndColorflag()+ 
        scrColorflag(c_yellow)+"
        ssh"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Move to another computer"+scrEndColorflag()+  
        scrColorflag(c_yellow)+"
        sudo"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Use"+scrEndColorflag()+ scrColorflag(c_yellow)+" command "+scrEndColorflag()+ scrColorflag(c_white)+"as andministrator"+scrEndColorflag()+ 
        scrColorflag(c_yellow)+"
        ls"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - List files"+scrEndColorflag()+  
        scrColorflag(c_yellow)+"
        help"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display tihs help"+scrEndColorflag()+
        scrColorflag(c_yellow)+"
        cat"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display file content
        
        Type your"+scrEndColorflag()+scrEndColorflag()+
        scrColorflag(c_yellow)+" command "+scrEndColorflag()+
        scrColorflag(c_white)+"below and press enter to execute it.

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
    }

else if keyboard_string = ">ssh"
    {
        scrText(scrColorflag(c_red)+"
        You must specify a computer"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_orange)+"ssh "+scrEndColorflag()+scrColorflag(c_yellow)+"computer
        
"
+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}    

else if keyboard_string = ">sudo"
    {
        scrText(scrColorflag(c_red)+"
        You must specify a command"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_orange)+"sudo "+scrEndColorflag()+scrColorflag(c_yellow)+"command
        
"
+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}    
    
else if keyboard_string = ">ls"
    {
        scrText(scrColorflag(c_aqua)+"
        motd.bin"+scrEndColorflag()+scrColorflag(c_red)+"
        wilterk.mail
        birthday.jpeg

"
+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
else if (keyboard_string = ">cat") ||(keyboard_string = ">sudo cat")
    {
        scrText(scrColorflag(c_red)+"
        You must specify a file to display"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_yellow)+"cat "+scrEndColorflag()+scrColorflag(c_aqua)+"filename
        
"
+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}

else if keyboard_string = ">ssh wilterk"
    {
        scrText("
        ")
        keyboard_string = "date_of_birth(dd/mm/yy)? ";
        inputText = keyboard_string;
        exit
    }

str        = keyboard_string; 
splitArray = ds_list_create();
actualWord = "";
target[0]  = ">cat"; target[1] = "birthday.jpeg"; target[2] = "motd.bin"; target[3] = "wilterk.mail";
target[4]  = "date_of_birth(dd/mm/yy)?"; target[5]  = "05/11/85";
target[6]  = ">ssh"; target[7]  = "wilterk"; 
target[8]  = ">sudo"; target[9]  = "cat";
pass       = true;

str = str + " ";
for (i = 1; i <= string_length(str); i++)
    {
     if (string_char_at(str,i) == chr(32)) 
        {
         ds_list_add(splitArray,actualWord);
         actualWord = "";
        }
     else
         {
           actualWord += string_char_at(str,i);
         }
    
    }
    
if (splitArray[| 0] = target[0])
{
if (splitArray[| 1] = target[1])
{
scrText( scrColorflag(c_red)+"
       This file must be open as administrator
       
"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
else if (splitArray[| 1] = target[2])
{
scrText(scrColorflag(c_white)+"
 You neeed move to another computer to use databse.
 Use commmand "+scrEndColorflag()+
        scrColorflag(c_yellow)+"ssh wilterk "+scrEndColorflag()+
        scrColorflag(c_white)+"to move to wilterk´s computer "+scrEndColorflag()+ "

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
else if (splitArray[| 1] = target[3])
{
scrText(scrColorflag(c_red)+" 
        This file must be open as administrator
        
"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
else
{
scrText(scrColorflag(c_red)+"
        Unknow file '" +splitArray[| 1]+"'

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
exit
}

if (splitArray[| 0] = target[4])
{
if (splitArray[| 1] = target[5])
{
scrText(scrColorflag(c_lime)+"
        Access granted.

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
alarm[1] = 20;
}
else
{
scrText(scrColorflag(c_red)+"
        Wrong date, access denied.

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
}
exit
}

if (splitArray[| 0] = target[6])
{
if (splitArray[| 1] = target[7])
{
txt += scrColorflag(c_red)+"
        Eroor

"+scrEndColorflag();
scrText("
        Eroor

");
keyboard_string = ">";
inputText = keyboard_string;
alarm[1] = 20;
}
else
{
scrText(scrColorflag(c_red)+"
        Unknow computer '" +splitArray[| 1]+"'

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
}
exit
}



if (splitArray[| 0] = target[8])
{
if (splitArray[| 1] = target[9])
{
if (splitArray[| 2] = target[1])
{
with(pictures){instance_destroy()}
instance_create(700,0,oCake)
scrText(scrColorflag(c_gray)+"
        Picture was shown in another terminal
        Press Escape to close it.
        
"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
}
else if (splitArray[| 2] = target[3])
{
scrText(scrColorflag(c_white)+"
        Sent the 05/11/15 6:28 AM <wilterk@mail.com> wrote:
        
        Hey Danny,
        
        Tonight´s is Daniels birthday party. 
        We bought a gift, everyone should give $5.
        
        See you tonight
        
        Will

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
}
else
{
scrText(scrColorflag(c_red)+"
        File does not exists or this file can not run as administrator."+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_yellow)+"sudo cat "+scrEndColorflag()+scrColorflag(c_gray)+"filename
        
"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
exit
}
else
{
scrText(scrColorflag(c_red)+"
        Command does not exists or this command can not run as administrator."+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_orange)+"sudo "+scrEndColorflag()+scrColorflag(c_yellow)+"command
        
"
+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
exit
}
}


scrText(scrColorflag(c_red)+"
        command not found."+scrEndColorflag()+
        scrColorflag(c_white) +" Use " +scrEndColorflag()+
        scrColorflag(c_yellow)+"help "+scrEndColorflag()+
        scrColorflag(c_white)+"to list available " +scrEndColorflag()+
        scrColorflag(c_yellow)+"commands"+"."+scrEndColorflag()+ "

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;   



//---------------------------------------------------LEVEL2---------------------------------------------------
if keyboard_string = ">motd"
    {
       scrText(scrColorflag(c_red)+"
ERROR please confirm your identity first."+scrEndColorflag()+
        scrColorflag(c_white)+"Use command "+scrEndColorflag()+
        scrColorflag(c_yellow)+"unlock "+scrEndColorflag()+
        scrColorflag(c_white)+"to confirm your identity "+scrEndColorflag()+ "

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
        unlock"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Confirm your identity"+scrEndColorflag()+  
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

else if keyboard_string = ">unlock"
    {
        scrText("
        ")
        keyboard_string = "password? ";
        inputText = keyboard_string;
        exit
    }    
    
else if keyboard_string = ">ls"
    {
       scrText(scrColorflag(c_aqua)+"
        password.txt
        motd.bin
        help.doc

"
+scrEndColorflag())
keyboard_string = ">";
inputText = keyboard_string;
exit
}
else if keyboard_string = ">cat"
    {
       scrText(scrColorflag(c_red)+"
        You must specify a file to display"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_yellow)+"cat "+scrEndColorflag()+scrColorflag(c_aqua)+"filename
        
"
+scrEndColorflag())
keyboard_string = ">";
inputText = keyboard_string;
exit
}

str        = keyboard_string;
splitArray = ds_list_create();
actualWord = "";
target[0]  = ">cat"; target[1] = "password.txt"; target[2] = "motd.bin"; target[3] = "help.doc";
target[4]  = "password?"; target[5]  = "EK02GB";
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
scrText( scrColorflag(c_white)+"
       My password is 'EK02GB'
       
"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
}
else if (splitArray[| 1] = target[2])
{
scrText(scrColorflag(c_white)+">"+scrEndColorflag()+
scrColorflag(c_red)+"ERROR please confirm your identity first."+scrEndColorflag()+
scrColorflag(c_white)+"Use command "+scrEndColorflag()+
scrColorflag(c_yellow)+"unlock "+scrEndColorflag()+
scrColorflag(c_white)+"to confirm your identity 

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
}
else if (splitArray[| 1] = target[3])
{
scrText(scrColorflag(c_yellow)+"
        motd"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display the last system message"+scrEndColorflag()+ 
        scrColorflag(c_yellow)+"
        unlock"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Confirm your identity"+scrEndColorflag()+  
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
}
else
{
scrText(scrColorflag(c_red)+"
        Unknow file '" +splitArray[| 1]+"'

"+scrEndColorflag());

keyboard_string = ">";
inputText = keyboard_string;
}
exit
}

if (splitArray[| 0] = target[4])
{
if (splitArray[| 1] = target[5])
{
scrText( scrColorflag(c_lime)+"
        Access granted.

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
alarm[1] = 20;
}
else
{
scrText(scrColorflag(c_red)+"
        Wrong password, access denied.

"+scrEndColorflag());
keyboard_string = ">";
inputText = keyboard_string;
}
exit
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




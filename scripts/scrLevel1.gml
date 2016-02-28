//---------------------------------------------------LEVEL1---------------------------------------------------
    if keyboard_string = ">motd"
    {
scrText(scrColorflag(c_red)+"
        Access denied! Please "+scrEndColorflag()+
        scrColorflag(c_yellow)+"login"+scrEndColorflag()+
        scrColorflag(c_white)+"."+scrEndColorflag()+"

"+ scrEndColorflag());
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
        login"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Login on the system"+scrEndColorflag()+  
        scrColorflag(c_yellow)+"
        password"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display the password"+scrEndColorflag()+  
        scrColorflag(c_yellow)+"
        help"+scrEndColorflag()+ 
        scrColorflag(c_white)+" - Display tihs help
        
        Type your"+scrEndColorflag()+scrEndColorflag()+
        scrColorflag(c_yellow)+" command "+scrEndColorflag()+
        scrColorflag(c_white)+"below and press enter to execute it.

"+scrEndColorflag())
keyboard_string = ">";
inputText = keyboard_string;
exit
    }
    else if keyboard_string = ">password"
    {
        scrText( scrColorflag(c_white)+"
        the password is "+scrEndColorflag()+
        scrColorflag(c_lime)+"jackdaniel"+scrEndColorflag()+
        scrColorflag(c_white)+".

"+scrEndColorflag());
/*DEBUG - scrText( scrColorflag(c_white)+"the password is "+scrEndColorflag()+scrColorflag(c_lime)+"jackdaniel"+scrEndColorflag()+scrColorflag(c_white)+"."+scrEndColorflag());*/
keyboard_string = ">";
inputText = keyboard_string;
exit
    }
    
    
    
    else if keyboard_string = ">login"
    {
        txt+="
        "
        keyboard_string = "password? ";
        inputText = keyboard_string;
        exit
    }
    
str        = keyboard_string;
splitArray = ds_list_create();
actualWord = "";
target[0]  = "password?"; target[1] = "jackdaniel";
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
txt += scrColorflag(c_lime)+"
        Access granted.

"+scrEndColorflag();
scrText("
        Access granted.

");
alarm[1] = 20;
keyboard_string = ">";
inputText = keyboard_string;
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

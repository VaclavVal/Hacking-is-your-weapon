//---------------------------------------------------LEVEL1---------------------------------------------------
    
    //--------------- MOTD ---------------\\
    if keyboard_string = ">motd"                
    {
txt+=scrColorflag(c_white)+"
        Wellcome in the"+scrEndColorflag()+
        scrColorflag(c_aqua)+" wWw "+scrEndColorflag()+
        scrColorflag(c_white)+ "complex - a secret government company."+scrEndColorflag()+
        scrColorflag(c_red)+"
        Access denied! Please "+scrEndColorflag()+
        scrColorflag(c_yellow)+"login"+scrEndColorflag()+
        scrColorflag(c_white)+" to proceed."+scrEndColorflag()+"

"+ scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
    }
    
    //--------------- HELP ---------------\\
    else if keyboard_string = ">help"                
    {
        txt+=scrColorflag(c_yellow)+"
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

"+scrEndColorflag()
keyboard_string = ">";
inputText = keyboard_string;
exit
    }
    
    //--------------- PASSWORD ---------------\\
    else if keyboard_string = ">password"                
    {
    txt+= scrColorflag(c_white)+"
        the password is "+scrEndColorflag()+
        scrColorflag(c_lime)+"jackdaniel"+scrEndColorflag()+
        scrColorflag(c_white)+".

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
    }
    
    //--------------- LOGIN ---------------\\
    else if keyboard_string = ">login"
    {
        txt+="
        "
        keyboard_string = "password? ";
        inputText = keyboard_string;
        exit
    }
    
//------------------------------------------- KOMBINOVANÁ SEKCE -------------------------------------------\\    

str        = keyboard_string;
splitArray = ds_list_create();
actualWord = "";

//---------- CÍLE ----------\\  
target[0]  = "password?"; target[1] = "jackdaniel";  
pass       = true;

//---------- SYSTÉM ----------\\  
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

    
//---------- PODMÍNKY ----------\\          

//---------- 1. SLOVO = PASSWORD? (PASSWORD .....) ----------\\  
if (splitArray[| 0] = target[0]) 
{
//---------- 2. SLOVO = JACKDANIEL (PASSWORD JAACKDANIEL) ----------\\  
if (splitArray[| 1] = target[1])
{
txt+=scrColorflag(c_lime)+"
        Access granted.

"+scrEndColorflag();
alarm[1] = 20;
keyboard_string = ">";
inputText = keyboard_string;
}

else

//---------- NESPRÁVNÉ HESLO (PASSWORD *****) ----------\\  
{
txt+=scrColorflag(c_red)+"
        Wrong password, access denied.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}
exit
}
    

//--------------- NEZNÁMÝ PŘÍKAZ (*****) ---------------\\
txt+=scrColorflag(c_red)+"
        command not found."+scrEndColorflag()+
        scrColorflag(c_white) +" Use " +scrEndColorflag()+
        scrColorflag(c_yellow)+"help "+scrEndColorflag()+
        scrColorflag(c_white)+"to list available " +scrEndColorflag()+
        scrColorflag(c_yellow)+"commands"+"."+scrEndColorflag()+ "

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;    

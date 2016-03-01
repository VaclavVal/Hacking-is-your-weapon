//---------------------------------------------------LEVEL2---------------------------------------------------
    
    //--------------- MOTD ---------------\\
if keyboard_string = ">motd"
    {
       txt+=scrColorflag(c_red)+"
ERROR please confirm your identity first."+scrEndColorflag()+
        scrColorflag(c_white)+"Use command "+scrEndColorflag()+
        scrColorflag(c_yellow)+"unlock "+scrEndColorflag()+
        scrColorflag(c_white)+"to confirm your identity "+scrEndColorflag()+ "

"+scrEndColorflag();
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

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
    }
    
    //--------------- UNLOCK ---------------\\
else if keyboard_string = ">unlock"
    {
        txt+="
        ";
        keyboard_string = "password? ";
        inputText = keyboard_string;
        exit
    }    
    
    //--------------- LS ---------------\\
else if keyboard_string = ">ls"
    {
       txt+=scrColorflag(c_aqua)+"
        password.txt
        motd.bin
        help.doc

"
+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}

    //--------------- CAT ---------------\\
else if keyboard_string = ">cat"
    {
       txt+=scrColorflag(c_red)+"
        You must specify a file to display"+scrEndColorflag()+scrColorflag(c_gray)+"
        Usage: "+scrEndColorflag()+scrColorflag(c_yellow)+"cat "+scrEndColorflag()+scrColorflag(c_aqua)+"filename
        
"
+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
exit
}



//------------------------------------------- KOMBINOVANÁ SEKCE -------------------------------------------\\    

str        = keyboard_string;
splitArray = ds_list_create();
actualWord = "";

//---------- CÍLE ----------\\  
target[0]  = ">cat"; target[1] = "password.txt"; target[2] = "motd.bin"; target[3] = "help.doc";
target[4]  = "password?"; target[5]  = "EK02GB";
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
  
//---------- 1. SLOVO = CAT (CAT .....) ----------\\      
if (splitArray[| 0] = target[0])
{

//---------- 2. SLOVO = PASSWORD.TXT (CAT PASSWORD.TXT) ----------\\  
if (splitArray[| 1] = target[1])
{
txt+= scrColorflag(c_white)+"
       My password is 'EK02GB'
       
"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}

//---------- 2. SLOVO = MOTD.BIN (CAT MOTD.BIN) ----------\\ 
else if (splitArray[| 1] = target[2])
{
txt+=scrColorflag(c_white)+">"+scrEndColorflag()+
scrColorflag(c_red)+"ERROR please confirm your identity first."+scrEndColorflag()+
scrColorflag(c_white)+"Use command "+scrEndColorflag()+
scrColorflag(c_yellow)+"unlock "+scrEndColorflag()+
scrColorflag(c_white)+"to confirm your identity 

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}

//---------- 2. SLOVO = HELP.DOC (CAT HELP.DOC) ----------\\ 
else if (splitArray[| 1] = target[3])
{
txt+=scrColorflag(c_yellow)+"
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

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
}

//---------- NEZNÁMÝ SOUBOR (CAT *****) ----------\\ 
else
{
txt+=scrColorflag(c_red)+"
        Unknow file '" +splitArray[| 1]+"'

"+scrEndColorflag();

keyboard_string = ">";
inputText = keyboard_string;
}
exit
}

//---------- 1. SLOVO = PASSWORD? (PASSWORD? .....) ----------\\ 
if (splitArray[| 0] = target[4])
{

//---------- 2. SLOVO = EK02GB (PASSWORD? EKO2GB) ----------\\ 
if (splitArray[| 1] = target[5])
{
txt+= scrColorflag(c_lime)+"
        Access granted.

"+scrEndColorflag();
keyboard_string = ">";
inputText = keyboard_string;
alarm[1] = 20;
}

//---------- NESPRÁVNÉ HESLO (PASSWORD? *****) ----------\\ 
else
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


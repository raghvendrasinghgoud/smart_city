/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const namePattern=/^[A-Za-z]/;
const datePattern=/^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4}|[0-9]{2})$/;
const emailPattern=/^[A-Za-z0-9._]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$/;
const phonePattern=/^\d{10}$/;
const pinPattern=/^[0-9]{6}$/;
let validField=[false,false,false,false,false,false,false];
function nameCheck(name){
    if(name.match(namePattern) && name.length!==0) return validField[0]=true;
    else return validField[0]=false;
}
function dateCheck(date){
    if(date.match(datePattern) && date.length!==0) return validField[1]=true;
    else return validField[1]=false;
}
function emailCheck(email){
       if(email.match(emailPattern) && email.length!==0) return true;
       else return false;
}
function phoneCheck(phone){
    if(phone.match(phonePattern) && phone.length!==0) return validField[3]=true;
    else return validField[3]=false;
}
function pinCheck(pin){
    if(pin.match(pinPattern) && pin.length!==0) return validField[4]=true;
    else return validField[4]=false;
}

function checkIfUserExists(id){
    const request = new XMLHttpRequest();
    request.open("GET",`emailExists?id=${id}`,true);
    let flag;
    // Sending the request to the server
    request.send();
    
    // Defining event listener for readystatechange event
     request.onreadystatechange = function(){
        // Check if the request is compete and was successful
        if(request.readyState === 4 && request.status === 200) {
            // Inserting the response from server into an HTML element
            let res =request.responseText;
            if(res==="not found"){
            console.log(res);
                setErrorMsg("Email is valid",true);
                document.getElementById('email').style.border="1px grey";
                validField[2]=true;
            }else{
                setErrorMsg("Email already registered",false);
                document.getElementById('email').style.border="1px solid red";
                validField[2]=false;
            }
        
        }
        
    };
    
}
function otpRequest(email){
    const request = new XMLHttpRequest();
    request.open("GET", `getOTP?email=${email}`,true);
    
    // Sending the request to the server
    request.send();
    
}

function otpMatch(otp){
    const request = new XMLHttpRequest();
    request.open("GET", `/matchOTP?otp=${otp}`);
    
    // Sending the request to the server
    request.send();
    
    // Defining event listener for readystatechange event
    request.onreadystatechange = function () {
        // Check if the request is compete and was successful
        if(request.readyState === 4 && request.status === 200) {
            // Inserting the response from server into an HTML element
            let res = request.responseText;
            if(res==="matched"){
                document.getElementById('otpinput').style.display="none";
                document.getElementById('email').style.color="green";
                document.getElementById('error').innerHTML="Email Verified Successfully";
                document.getElementById('error').setAttribute('class','alert alert-success');
            }else{
                document.getElementById('error').innerHTML="Wrong OTP!!  Try Again";
        document.getElementById('error').setAttribute('class','alert alert-danger');
            }
        }
    };
}
function setErrorMsg(msg,good){
    if(good){
        document.getElementById('error').setAttribute('class','alert alert-success');
        document.getElementById('error').innerHTML="<strong>"+msg+"</strong>";
        
    }else{
    document.getElementById('error').setAttribute('class','alert alert-danger');
    document.getElementById('error').innerHTML="<strong>"+msg+"</strong>";
}
}

document.getElementById('fname').addEventListener("focusout",()=>{
    console.log(nameCheck(document.getElementById('fname').value));
    if(!nameCheck(document.getElementById('fname').value)){
        setErrorMsg("Invalid First Name",false);
        document.getElementById('fname').style.border="1px solid red";
        
    }else{
        setErrorMsg("Valid First Name",true);
        document.getElementById('fname').style.border="1px grey";
        
    }
});

document.getElementById('lname').addEventListener("focusout",()=>{
    if(!nameCheck(document.getElementById('lname').value)){
        setErrorMsg("Invalid Last Name",false);
        document.getElementById('lname').style.border="1px solid red";
        validField[5]=false;
    }else{
        setErrorMsg("Valid Last Name",true);
        document.getElementById('lname').style.border="1px grey";
        validField[5]=true;
    }
});

document.getElementById('date').addEventListener("focusout",()=>{
    if(!dateCheck(document.getElementById('date').value)){
        setErrorMsg("Invalid Date of Birth ");
        document.getElementById('date').style.border="1px solid red";
    }else{
        setErrorMsg("Valid Date",true);
        document.getElementById('date').style.border="1px grey";
    }
});


function emailExist(){
    console.log("email event strated");
    if(emailCheck(document.getElementById('email').value)){
        checkIfUserExists(document.getElementById('email').value);
        
}else{
        setErrorMsg("Invalid Email",false);
        document.getElementById('email').style.border="1px solid red";
    }
}

document.getElementById('email').addEventListener("focusout",emailExist);

document.getElementById('otpin').addEventListener('focusout',()=>{
    let otp=document.getElementById('otpin').value;
    
    otpMatch(otp);    
});

//document.getElementById('otpbtn').addEventListener('click',()=>{
//    otpRequest(document.getElementById('email').value);
//        document.getElementById('error').innerHTML="Email Sent Successfully";
//        document.getElementById('error').setAttribute('class','alert alert-success');
//        document.getElementById('otpinput').style.display="block";
//        document.getElementById('otpinput').style.color="red";
//});


document.getElementById('phone').addEventListener("focusout",()=>{
    if(!phoneCheck(document.getElementById('phone').value)){
        setErrorMsg("Invalid Phone",false);
        document.getElementById('phone').style.border="1px solid red";
    }else{
        setErrorMsg("Valid Phone",true);
        document.getElementById('phone').style.border="1px grey";
    }
});

document.getElementById('pin').addEventListener("focusout",()=>{
    console.log(pinCheck(document.getElementById('pin').value));
    if(!pinCheck(document.getElementById('pin').value)){
        setErrorMsg("Invalid Pincode",false);
        document.getElementById('pin').style.border="1px solid red";
    }else{
        setErrorMsg("Valid Pincode",true);
        document.getElementById('pin').style.border="1px grey";
    }
});

//add no. of staff memebrs fields

document.getElementById('staffnum').addEventListener('focusout',()=>{
    let n=document.getElementById('staffnum').value;
    
    let inhtml="";
    
    for(let i=1;i<=n;i++){
        inhtml+=`<div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control staff" name="ename${i}" id="ename${i}" placeholder="Employee Name" >
              <div class="validate"></div>
            </div>
              <div class="col-md-6 form-group mt-3 mt-md-0">
              <input type="text" class="form-control staff" name="design${i}" id="desig${i}" placeholder="Designation" >
              <div class="validate"></div>
            </div>`
    }
        document.getElementById('staffmem').innerHTML=inhtml;
});


//adding no. of services fields
document.getElementById('servnum').addEventListener('focusout',()=>{
    let n=document.getElementById('servnum').value;
    
    let inhtml="";
    
    for(let i=1;i<=n;i++){
        inhtml+=`<div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control serv" name="servname${i}" id="servname${i}" placeholder="Service name" >
              <div class="validate"></div>
            </div>           
                       <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="number" class="form-control serv" name="servrate${i}" id="servrate${i}" placeholder="Rate" >
              <div class="validate"></div>
            </div>
                       <div class="col-md-4 form-group mt-3 mt-md-0">
              <input type="text" class="form-control serv" name="servdesc${i}" id="servdesc${i}" placeholder="Description" >
              <div class="validate"></div>
            </div>`
    }
        document.getElementById('servlist').innerHTML=inhtml;
});

document.getElementById('usertype').addEventListener('change',()=>{
    let val=document.getElementById('usertype').value;
    console.log(val);
    if(val==="serviceprovider"){
        document.getElementById('sp').style.display="block";
        validField[6]=true;
    }else{ 
        if(val==="customer"){
            document.getElementById('sp').style.display="none" ;    
            validField[6]=true;
        }else {
            setErrorMsg("Select User Type",false);
        document.getElementById('pin').style.border="1px solid red";
            validField[6]=false;
            
        }
        
    };
})

function isAllTrue(){
    console.log("usertype="+document.getElementById('usertype').value);
    for(let i=0;i<=6;i++){
        if(validField[i]===false){
            setErrorMsg("Something went wrong checkk all the fields",false);
            return false;
        }
    }
    
    //special validation forservice provider
    
    let val=document.getElementById('usertype').value;
    console.log(val);
    if(val==="serviceprovider"){
        console.log("in the staf and serv field checking...");
        //for staff
        let stn=document.getElementById('staffnum').value;
        for(let i=0;i<stn*2;i++){
            if(document.getElementsByClassName('staff')[i].value.length===0){
                setErrorMsg("Staff Fields Cannot be Empty!",false);
                document.getElementsByClassName('staff')[i].style.border="1px solid red";
                return false;
            }else{
                document.getElementsByClassName('staff')[i].style.border="1px grey";
            }
        }
        
        //for service
        let sn=document.getElementById('servnum').value;
        for(let i=0;i<sn*3;i++){
            if(document.getElementsByClassName('serv')[i].value.length===0){
                setErrorMsg("Service Fields Cannot be Empty!",false);
                document.getElementsByClassName('serv')[i].style.border="1px solid red";
                return false;
            }else{
                document.getElementsByClassName('serv')[i].style.border="1px grey";
            }
        }
    } 
    
    
    return true;
}

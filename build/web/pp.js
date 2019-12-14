/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var x = document.querySelector("#p");
var y = document.querySelector("#c");

y.addEventListener("keyup", function(){
    
    if (y.value!=="Philippines")
        x.style.visibility = "visible";
    else
        x.style.visibility = "hidden";
});

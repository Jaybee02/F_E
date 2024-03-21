// The below  code show demonstartion of how Require Error works
//The condition that must  be met
function myRequire(unit_k){ 
    require(_k<16, "The value of K must be less than 16");
}


// The following code is about to demonstrate how Assert Error works
// comes in form of boolean 
function myAssert(){
    sum = 1 ;
    assert (sum == 1);

}


// The next code demonstrate how Revert works
function myRevert(unit_j){
    // then a condition to be met
    if(_j > 12){
        revert("The value of j must be greater than 12");
    }
}
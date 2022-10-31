
import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor Debuke{
 
 stable var currentValue:Float= 300;
//  currentValue:= 300;
//  Debug.print(debug_show(currentValue));

stable var startTime = Time.now();
// startTime := Time.now();
Debug.print(debug_show(startTime));

 public query func show():async Float{
  return currentValue;
 };

public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
};
public func widraw(amount : Float){
    let tempValue :Float = currentValue-amount;
    if(tempValue>=0)
   {
     currentValue-=amount;
    Debug.print(debug_show(currentValue));
    }
    else {
         Debug.print("Amount is too large ,currentValue is less than zero");
    }
};


 
  // topUp()
// 
//  dfx canister id debuke
//http://127.0.0.1:8000/?canisterId=<CANDID-UI-CANISTER-IDENTIFIER>
 public func compund(){
  let currentTime = Time.now();
  let timeElaspedNS= currentTime-startTime;
  let timeElaspedS= timeElaspedNS/1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElaspedS));
  startTime:=currentTime;
 };
 


}




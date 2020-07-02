document.getElementById("startOver").addEventListener("click", startOver); 
document.getElementById("showContent").addEventListener("click", revealContent); 

function startOver() {
  var sections = document.getElementsByTagName("section");
  for (var i = 0; i < sections.length; i++) {
    sections[i].classList.add("hidden")
  }
  var start = document.getElementById("start");
  start.classList.remove("hidden")

}
 
function revealContent() {
  reveal();
} 

function hideAll() {
  var element = document.getElementById("start");
  element.classList.add("hidden");
}

function reveal() {
  console.log("trying to reveal");
  var element = document.getElementById("content");
  element.classList.remove("hidden");
  
}
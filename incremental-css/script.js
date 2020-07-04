document.getElementById("startOver").addEventListener("click", startOver); 

var html = document.querySelector('html');
var stepLinks = document.getElementsByClassName('step')
var sections = document.querySelectorAll('section')

for (var i = 0; i < stepLinks.length; i++) {
  console.log("adding event listeners");
  stepLinks[i].addEventListener("click", nextStep)
}


function nextStep() {
  var currentStep = this.dataset.step
  console.log(currentStep);
  var nextStep = parseInt(currentStep) + 1
  sections[nextStep].classList.remove("hidden")
  html.classList.add("step" + nextStep.toString())
}

var firstSection = sections[0]

function startOver() {
  html.className = ''
  for (var i = 0; i < sections.length; i++) {
    sections[i].classList.add("hidden")
  }
  firstSection.classList.remove("hidden")
}
 
function revealContent() {
  console.log("trying to reveal");
  html.classList.add("step0")
  sections[1].classList.remove("hidden")
} 

function revealNextSection() {
  console.log("trying to reveal text-styling");
  html.classList.add("step1")
  sections[2].classList.remove("hidden")
} 

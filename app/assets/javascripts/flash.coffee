document.addEventListener("turbolinks:load", () =>

  flash = document.getElementById("flash-wrapper")

  if flash
    console.log("removing flash")

    setTimeout(() =>
      flash.style.display = "none"
    , 6000)
  #console.log(document.getElementById("flash-wrapper"))
)

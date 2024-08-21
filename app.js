import React from "react";
import ReactDOM from "react-dom/client";

var hone = React.createElement("h1",{},"Heading");

var htmlRoot = document.getElementById("root");
var rootReact = ReactDOM.createRoot(htmlRoot);
//rootReact.render(hone);
console.log(hone);

var jsxHeading = <h1 id="jsxHeading">Heading from JSX!!</h1>
console.log(jsxHeading);

rootReact.render(jsxHeading);
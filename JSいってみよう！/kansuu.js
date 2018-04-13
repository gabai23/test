document.write("<br>");
/*1*/
function menseki(r,pi=3.14){
    return (r*r*pi);
}

document.write(menseki(5)+"<br>");
document.write(menseki(7)+"<br>");
document.write(menseki(10)+"<br>");


/*2*/

function ryoukin(a,c,adult=500,child=200){
    return (a*adult + c*child) ;
}

document.write(ryoukin(2,4)+"<br>");
document.write(ryoukin(1,5)+"<br>");
document.write(ryoukin(3,7)+"<br>");

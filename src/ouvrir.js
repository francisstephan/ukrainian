openDic = function (id){
  copyTextToClipboard(id);
  var text = document.getElementById(id).innerHTML ;
  // let result = text.replace(/ /g, "+");
  var chaine="https://logeion.uchicago.edu/"+text
  window.open(chaine);
}
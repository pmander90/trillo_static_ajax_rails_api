var Card = function(id, description, completed){
  this.id = id;
  this.description = description;
  this.completed = completed;
}

Card.prototype = {
  save: function(){
    $.ajax({
      type: 'POST',
      data: { card: {description: this.description, completed: this.completed}},
      dataType: 'json',
      url: "/cards"
    }).done(function(response){
      console.log("model saved")
      trilloModel.fetchCards();
    }).fail(function(){
      console.log("failed to save")
    })
  },
  update: function(data){
    $.ajax({
      type: 'PUT',
      data: {card: data},
      dataType: 'json',
      url: "/cards/" + this.id
    }).done(function(response){
      trilloModel.fetchCards();
      console.log("model updated")
    }).fail(function(){
      console.log("failed to updated")
    })
  }
}

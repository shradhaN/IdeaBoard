import React from 'react'

class Idea extends React.Component {

  handleClick = () => {
    this.props.onClick(this.props.idea.id)
  }

  handleDelete = () => {
    this.props.onDelete(this.props.idea.id)
  }

  render(){
    const {idea: {title, body}} = this.props;
    return(
    <div className="title" >
      <span className="deleteButton" onClick={this.handleDelete} >x</span>
      <h4 onClick={this.handleClick}>{title}</h4>
      <p onClick={this.handleClick}>{body}</p>
    </div>
    )
  }
}

export default Idea

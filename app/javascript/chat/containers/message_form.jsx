import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { createMessage } from '../actions/index';

import 'emoji-mart/css/emoji-mart.css'
import { Picker } from 'emoji-mart'

class MessageForm extends Component {
  constructor(props) {
    super(props);
    this.state = { value: '', showEmojis: false };
  }

  componentDidMount() {
    this.messageBox.focus();
  }

  handleChange = (event) => {
    this.setState({ value: event.target.value });
  }

  showEmojis = e => {
    this.setState(
      {
        showEmojis: true
      },
      () => document.addEventListener("click", this.closeMenu)
    );
  };

  closeMenu = e => {
    console.log(this.emojiPicker);
    if (this.emojiPicker !== null && !this.emojiPicker.contains(e.target)) {
      this.setState(
        {
          showEmojis: false
        },
        () => document.removeEventListener("click", this.closeMenu)
      );
    }
  };

  addEmoji = (e) => {
    console.log(e.native);
    let emoji = e.native;
    this.setState({
      text: this.setState({ value: this.state.value + emoji })
    });
  };

  handleSubmit = (event) => {
    event.preventDefault();
    this.props.createMessage(this.props.selectedChannel, this.state.value);
    this.setState({ value: '' }); // Reset message input
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit} className="channel-editor">
        {this.state.showEmojis ? (
          <span className="emojiPicker" ref={el => (this.emojiPicker = el)}>
            <Picker
              onSelect={this.addEmoji}
              emojiTooltip={true}
              title="weChat"
            />
          </span>
          ) : (
          <p className="getEmojiButton" onClick={this.showEmojis}>
            {String.fromCodePoint(0x1f60a)}
          </p>
        )}
        <input
          ref={(input) => { this.messageBox = input; }}
          type="text"
          className="form-control"
          autoComplete="off"
          value={this.state.value}
          onChange={this.handleChange}
          placeholder={"Message #" + this.props.selectedChannel}
        />
        <button type="submit"><i class="far fa-paper-plane"></i></button>
      </form>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ createMessage }, dispatch);
}

export default connect(null, mapDispatchToProps)(MessageForm);

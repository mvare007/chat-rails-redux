import React from 'react';
import { Link } from 'react-router-dom';

import ChannelList from '../containers/channel_list';
import MessageList from '../containers/message_list';


const App = (props) => {
  return (
    <div className="messaging-wrapper">
      <div className="logo-container">
        <img className="messaging-logo" src="https://cdn.iconscout.com/icon/free/png-256/slack-1425877-1205068.png" alt="slack-logo" />
      </div>
      <ChannelList selectedChannel={props.match.params.channel} />
      <MessageList selectedChannel={props.match.params.channel} />
    </div>
  );
};

export default App;

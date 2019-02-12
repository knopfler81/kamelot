import React from "react"
import PropTypes from "prop-types"

import { SketchPicker } from 'react-color'


class ColorpickerMainBtn extends React.Component {

  constructor(props) {
    super(props);

    this.state = { selector: props.selector };

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange = (main_color) => {
  	$("#clients").find('.btn-main').each(function(){
  		$(this).attr('style', 'background: ' + main_color.hex + '!important;')
  	});

	  let elem = document.querySelector('#' + this.state.selector);
 
	  elem.value = main_color.hex;
  }

  

  render(){
    return  (
        <React.Fragment>
          <SketchPicker color={this.props.color}
                        onChange={this.handleChange}/>
        </React.Fragment>
    );
  }
}

ColorpickerMainBtn.propTypes = {};

export default ColorpickerMainBtn
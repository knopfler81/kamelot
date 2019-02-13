import React from "react"
import PropTypes from "prop-types"

import { SketchPicker } from 'react-color'


class ColorpickerMainBtnText extends React.Component {

  constructor(props) {
    super(props);

    this.state = { selector: props.selector };

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange = (main_color) => {
  	$("#clients").find('.btn-main').each(function(){
  		$(this).attr('style', 'color: ' + main_color.hex + '!important;')
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

ColorpickerMainBtnText.propTypes = {};

export default ColorpickerMainBtnText
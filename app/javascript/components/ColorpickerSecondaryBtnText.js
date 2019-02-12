import React from "react"
import PropTypes from "prop-types"

import { SketchPicker } from 'react-color'


class ColorpickerSecondaryBtnText extends React.Component {

  constructor(props) {
    super(props);

    this.state = { selector: props.selector };

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange = (secondary_color) => {
  	$("#clients").find('.btn-secondary').each(function(){
  		$(this).attr('style', 'color: ' + secondary_color.hex + '!important;')
  	});

	  let elem = document.querySelector('#' + this.state.selector);
 
	  elem.value = secondary_color.hex;
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

ColorpickerSecondaryBtnText.propTypes = {};

export default ColorpickerSecondaryBtnText
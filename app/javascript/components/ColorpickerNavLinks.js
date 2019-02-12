import React from "react"
import PropTypes from "prop-types"

import { SketchPicker } from 'react-color'


class ColorpickerNavLinks extends React.Component {

  constructor(props) {
    super(props);

    this.state = { selector: props.selector };

    this.handleChange = this.handleChange.bind(this);
  }

    handleChange = (nav_links_color) => {

      $("#nav-upper-clients").find('input').each(function(){
        $(this).attr('style', 'border-color: ' + nav_links_color.hex + ' !important;')
      });

      $("#nav-upper-clients").find('a').each(function(){
          $(this).attr('style', 'color: ' + nav_links_color.hex + ' !important;')

      });

      $("#nav-upper-clients").find(".fa").each(function(){
          $(this).attr('style', 'color: ' + nav_links_color.hex + ' !important;')
      });
      
      $("#nav-lower-clients").find('a').each(function(){
          $(this).attr('style', 'color: ' + nav_links_color.hex + ' !important;')
      });

        let elem = document.querySelector('#' + this.state.selector);

        elem.value = nav_links_color.hex;
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

ColorpickerNavLinks.propTypes = {};

export default ColorpickerNavLinks



import React from "react"
import PropTypes from "prop-types"
import { SketchPicker } from "react-color"


class ColorpickerTextColor extends React.Component {

	constructor(props) {
		super(props);

		this.state = { selector: props.selector };

		this.handleChange = this.handleChange.bind(this);
	}

	handleChange = (text_color) => {
		$("#clients").attr('style', 'color: ' + text_color.hex + '!important;')


		let elem = document.querySelector('#' + this.state.selector);

		elem.value = text_color.hex;
	}

	render() {
		return (
			<React.Fragment>
				<SketchPicker color={this.props.color}
											onChange={this.handleChange} />
			</React.Fragment>
		);
	}
}

ColorpickerTextColor.propTypes =  {};

export default ColorpickerTextColor
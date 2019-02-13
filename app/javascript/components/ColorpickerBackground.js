import React from "react"
import PropTypes from "prop-types"
import { SketchPicker } from "react-color"


class ColorpickerBackground extends React.Component {

	constructor(props) {
		super(props);

		this.state = { selector: props.selector };

		this.handleChange = this.handleChange.bind(this);
	}

	handleChange = (background_color) => {
		document.body.style.background = background_color.hex;

		let elem = document.querySelector('#' + this.state.selector);

		elem.value = background_color.hex;
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

ColorpickerBackground.propTypes =  {};

export default ColorpickerBackground
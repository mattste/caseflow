import React, { Component } from 'react';
import SearchableDropdown from '../../components/SearchableDropdown';
import StyleGuideComponentTitle from '../../components/StyleGuideComponentTitle';

class StyleGuideSearchableDropdown extends Component {
  constructor(props) {
    super(props);

    this.state = {
      value: null
    };
  }

  onChange = (value) => value;

  render() {
    const creatableOptions = {
      tagAlreadyExistsMsg: 'Tag already exists',
      promptTextCreator: (label) => `Create a tag for "${label}"`
    };

    const options = [{ value: 'unitedstates',
      label: 'United States' },
    { value: 'germany',
      label: 'Germany' },
    { value: 'france',
      label: 'France' },
    { value: 'russia',
      label: 'Russia' },
    { value: 'china',
      label: 'China' },
    { value: 'india',
      label: 'India' },
    { value: 'uae',
      label: 'United Arab Emrites' }];

    return (
      <div>
        <StyleGuideComponentTitle
          title="Dropdown Menus"
          id="dropdowns"
          link="StyleGuideSearchableDropdown.jsx"
        />
        <h3>Dropdown</h3>
        <SearchableDropdown
          label="Dropdown"
          name="no-search-select-countries"
          options={options}
          onChange={this.onChange}
          required={true}
          searchable={false}
        />
        <p>The searchable dropdowns provide more context to users' choices.
          This is helpful in cases where there is a large dropdown menu with many options.
          This dual behavior dropdown component make the dropdown easier to use and
          options more readily available for the user.</p>
        <h3>Single Select Searchable Dropdown</h3>
        <SearchableDropdown
          label="Searchable dropdown"
          name="single-select-countries"
          options={options}
          onChange={this.onChange}
          required={true}
        />
        <h3>Creatable Searchable Multiselect Dropdown</h3>
        <SearchableDropdown
          creatable={true}
          label="Click in the box below to select, type, or add issue(s)"
          name="multi-select-countries"
          options={options}
          required={true}
          multi={true}
          placeholder="Select options"
          creatable={true}
          creatableOptions={creatableOptions}
        />
      </div>
    );
  }
}

export default StyleGuideSearchableDropdown;

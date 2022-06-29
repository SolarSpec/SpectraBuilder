<div id="top"></div>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SolarSpec/SpectraBuilder">
    <img src="SpectrabuilderGUI_resources/logo.png" alt="SolarSpec" width="160" height="120">
  </a>

<h3 align="center">Spectrabuilder GUI</h3>

  <p align="center">
    A Graphical User Interface
    <br />
    <a href="https://github.com/SolarSpec/SpectraBuilder"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/SolarSpec/SpectraBuilder">View Demo</a>
    ·
    <a href="https://github.com/SolarSpec/SpectraBuilder/issues">Report Bug</a>
    ·
    <a href="https://github.com/SolarSpec/SpectraBuilder/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![SpectraBuilder Screenshot][product-screenshot]](https://solarspec.ok.ubc.ca/)
Format basic properties of your plots through our GUI

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [MATLAB](https://www.mathworks.com/products/matlab.html)
* [TDMS Reader Addon](https://www.mathworks.com/matlabcentral/fileexchange/30023-tdms-reader)
* [Image Processing Toolbox](https://www.mathworks.com/help/images/)
* [Curve Fitting Toolbox](https://www.mathworks.com/help/curvefit/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To begin using this app is very simple. Just verify you have the necessary prequisites and follow the installation instructions.

### Prerequisites

Make sure MATLAB is installed. It is available for download in the Software Distribution section under the Help tab after you log into [Canvas.](https://canvas.ubc.ca/)
Click on the "Add-Ons" dropdown menu of your MATLAB Home screen. Then click on "Manage Add-Ons" and ensure you have the Image Processing Toolbox and the Curve Fitting Toolbox. If not, click on "Get Add-Ons" button instead and search for the aforementioned products.

### Installation

1. Clone the repo to your PC
   ```sh
   git clone https://github.com/SolarSpec/SpectraBuilder.git
   ```
2. Install the application
   ```
   Click on the .mlappinstall file in your repository to open and install in MATLAB
   ```
3. Browse the APPS header
   ```
   You will find the recently installed application and can add it to your favourites
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage
To begin, load some TAS or TAM (.tdms) data using the "Load TDMS Data" button or load exported data of previous use with the "Load Log Data" button. The app will plot the optical difference or absorption percentage vs. time (s). The next and previous buttons at the bottom of the middle panel allow you to iterate through your TDMS files. You can also keep the Y Axis fixed as you iterate instead of having the scale automatically calculated. You can also switch the kinetics scale between linear and logarithmic types. The center button below the kinetics plot allows you to reset the scale to focus around the current displayed data. The spectra plot below the kinetics showcases the calculated spectra of the given time slices (initially 6 slices).

In the right panel, the user can manually edit these slices by dragging the ROI lines or by inputting a specific centre time and changing the width. Due to log spacing, the time width is given in relative means (percentage). Below this table is metadata describing the background level, the wavelength of the current .tdms file, and additionally the channel chosen for the data. _If a certain channel is selected for the first .tdms file and is not present in the others, then the script follows a specified heirarchy of channels to assign: ["final A-B";"A-Test  dOD"] for processed data and ["B-Test  raw"; "A-Test  raw"] for raw data._ For ease of use, the correctly specified channel is highlighted in green whereas a backup channel is highlighted in red. The user can export the log spaced data as well as the spectra data in their own respective files using the two buttons at the bottom of the right panel.

 On the left panel, the linear and log data buttons below the load buttons correspond to the spacing of the current .tdms file; either linear or log spacing. The user can export each figure into vector graphics (.EMF) and save them in chosen folder of .tdms files. The user can also save all the variables/properties of the app to the currrent workspace for further investigation. This feature is more useful for developers. There is also a reset button that allows the user to startup the app with the same folder without having to load everything again. Finally, there is a "LogLog Figure" button that opens a secondary app that allows the user to view log(ABS) vs. log(Time) and calculate the linear relation of this scatter data.

This app is currently lacking in any examples. Coming soon...

_For more information on any of the internal functions, please refer to the [MATLAB Documentation](https://www.mathworks.com/help/matlab/)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [X] Accept TDMS A-B trace or just A trace
- [X] Plot Kinetics as Lin-Log or Log-Log
    - [X] Keep Y-axis fixed and switch between Y-scales
- [X] Build spectra data on specific time slice ROIs
- [X] Export spectra CSV and/or Log Data CSV and/or figures
- [X] Load data into Log-Log analysis app
- [X] Use ROIs or UITable to edit centre times and widths of time slices

See the [open issues](https://github.com/SolarSpec/SpectraBuilder/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the BSD 3-Clause License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

SolarSpec - [SolarSpec Website](https://solarspec.ok.ubc.ca/) - vidihari@student.ubc.ca

Project Link: [https://github.com/SolarSpec/SpectraBuilder](https://github.com/SolarSpec/SpectraBuilder)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Group Leader - Dr. Robert Godin](https://solarspec.ok.ubc.ca/people/)
* [Group Alumni - James Kivai](https://solarspec.ok.ubc.ca/people/)
* [The Entire SolarSpec Team](https://solarspec.ok.ubc.ca/people/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/SolarSpec/SpectraBuilder.svg?style=for-the-badge
[contributors-url]: https://github.com/SolarSpec/SpectraBuilder/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/SolarSpec/SpectraBuilder.svg?style=for-the-badge
[forks-url]: https://github.com/SolarSpec/SpectraBuilder/network/members
[stars-shield]: https://img.shields.io/github/stars/SolarSpec/SpectraBuilder.svg?style=for-the-badge
[stars-url]: https://github.com/SolarSpec/SpectraBuilder/stargazers
[issues-shield]: https://img.shields.io/github/issues/SolarSpec/SpectraBuilder.svg?style=for-the-badge
[issues-url]: https://github.com/SolarSpec/SpectraBuilder/issues
[license-shield]: https://img.shields.io/github/license/SolarSpec/SpectraBuilder.svg?style=for-the-badge
[license-url]: https://github.com/SolarSpec/SpectraBuilder/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/haris-vidimlic-06730019b/
[product-screenshot]: SpectrabuilderGUI_resources/Screenshot.png
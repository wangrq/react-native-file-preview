/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, TouchableOpacity} from 'react-native';
import FilePreview from 'react-native-file-preview';

export default class App extends Component {
  constructor(props) {
    super(props);

    this.buttonPress = this.buttonPress.bind(this);
  }
  buttonPress() {
    //FilePreview.showPreview("file:///data/Downloads/test.png");
    //FilePreview.showPreview("https://medium.com/@09mejohn/resource-bundles-in-ios-static-library-beba3070fafd");
    //FilePreview.showPreview("http://www.orimi.com/pdf-test.pdf");
    FilePreview.showPreview("https://acdbio.com/sites/default/files/sample.ppt");
  }
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>{"Welcome"}</Text>
        <Text style={styles.instructions}>Click the bellow button to open an online document:</Text>
        <TouchableOpacity onPress={this.buttonPress}>
          <Text>Open Document</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import prompt from '@system.prompt';
import { AppBar, NavigationIcon, Title, Headline, OptionMenu } from '@ohos/material-appbar'

@Entry
@Component
struct Index {
  private startModel: AppBar.Model = new AppBar.Model()
  private centerModel: AppBar.Model = new AppBar.Model()
  private headlineModel: AppBar.Model = new AppBar.Model()
  private titleHeadlineModel: AppBar.Model = new AppBar.Model()

  aboutToAppear() {
    this.buildStartAppBar()
    this.buildCenterAppBar()
    this.buildHeadlineAppBar()
    this.buildTitleHeadlineAppBar()
  }

  private navigationIconClick() {
    prompt.showToast({
      message: 'Navigation icon clicked'
    })
  }

  private optionClick(option: OptionMenu.Model) {
    prompt.showToast({
      message: 'Option:: ' + option.getLabel()
    })
  }

  private buildStartAppBar() {
    let navigationIcon = new NavigationIcon.Model()
      .setIcon($r('app.media.back'))
      .setWidth('24vp').setHeight('24vp')

    ImageSize
    let title = new Title.Model('Title')
      .setFontSize('20fp')
      .setFontColor(Color.White)
      .setTextAlign(TextAlign.Start)
      .setFontWeight(FontWeight.Normal)

    let options = [
      new OptionMenu.Model(1, "Attach File").setIcon($r('app.media.attach')),
      new OptionMenu.Model(2, "Schedule").setIcon($r('app.media.schedule')),
      new OptionMenu.Model(3, "User Profile").setIcon($r('app.media.icon'))
    ]

    this.startModel
      .setNavigationIcon(navigationIcon)
      .setTitleModel(title)
      .setOptions(options)
      .setBackgroundColor(Color.Green)
      .addNavigationListener(this.navigationIconClick)
      .addOptionListener(this.optionClick)
  }

  private buildCenterAppBar() {
    let navigationIcon = new NavigationIcon.Model().setIcon($r('app.media.menu'))
      .setWidth('24vp').setHeight('20vp')

    let title = new Title.Model('Title')
      .setFontSize('20fp')
      .setFontColor(Color.White)
      .setTextAlign(TextAlign.Center)
      .setFontWeight(FontWeight.Normal)

    let options = [
      new OptionMenu.Model(1, "User Profile").setIcon($r('app.media.user'))
    ]

    this.centerModel
      .setNavigationIcon(navigationIcon)
      .setTitleModel(title)
      .setOptions(options)
      .setBackgroundColor('#ff4622a4')
      .addNavigationListener(this.navigationIconClick)
      .addOptionListener(this.optionClick)
  }

  private buildHeadlineAppBar() {
    let navigationIcon = new NavigationIcon.Model().setIcon($r('app.media.back'))
      .setWidth('24vp').setHeight('24vp')

    let headline = new Headline.Model('Headline Title')
      .setFontSize('20fp')
      .setFontColor(Color.White)
      .setFontWeight(FontWeight.Normal)

    let options = [
      new OptionMenu.Model(1, "Attach File").setIcon($r('app.media.attach')),
      new OptionMenu.Model(2, "Schedule").setIcon($r('app.media.schedule')),
      new OptionMenu.Model(3, "User Profile").setIcon($r('app.media.icon'))
    ]

    this.headlineModel
      .setNavigationIcon(navigationIcon)
      .setOptions(options)
      .setHeadlineModel(headline)
      .setBackgroundColor(Color.Blue)
      .addNavigationListener(this.navigationIconClick)
      .addOptionListener(this.optionClick)
  }

  private buildTitleHeadlineAppBar() {
    let navigationIcon = new NavigationIcon.Model().setIcon($r('app.media.menu'))
      .setWidth('24vp').setHeight('20vp')

    let title = new Title.Model('Title')
      .setFontSize('20fp')
      .setFontColor(Color.White)
      .setTextAlign(TextAlign.Start)
      .setFontWeight(FontWeight.Normal)

    let headline = new Headline.Model('Headline Title')
      .setFontSize('20fp')
      .setFontColor(Color.White)
      .setFontWeight(FontWeight.Normal)

    let options = [
      new OptionMenu.Model(1, "Attach File").setIcon($r('app.media.attach')),
      new OptionMenu.Model(2, "Schedule").setIcon($r('app.media.schedule')),
      new OptionMenu.Model(3, "User Profile").setIcon($r('app.media.icon'))
    ]

    this.titleHeadlineModel
      .setNavigationIcon(navigationIcon)
      .setTitleModel(title)
      .setOptions(options)
      .setHeadlineModel(headline)
      .setBackgroundColor(Color.Red)
      .addNavigationListener(this.navigationIconClick)
      .addOptionListener(this.optionClick)
  }

  build() {

    Column() {

      Text('App Bar (Normal)').fontSize('24fp').width('100%')
        .margin({ left: '24vp', top: '24vp', bottom: '8vp' })

      AppBar({ model: this.startModel })

      Text('App Bar (Center Title)').fontSize('24fp').width('100%')
        .margin({ left: '24vp', top: '40vp', bottom: '8vp' })

      AppBar({ model: this.centerModel })

      Text('App Bar (Headline)').fontSize('24fp').width('100%')
        .margin({ left: '24vp', top: '40vp', bottom: '8vp' })

      AppBar({ model: this.headlineModel })

      Text('App Bar (Title & Headline)').fontSize('24fp').width('100%')
        .margin({ left: '24vp', top: '40vp', bottom: '8vp' })

      AppBar({ model: this.titleHeadlineModel })

    }

  }
}
Date.prototype.getWeek = function (dowOffset) {
  /*getWeek() was developed by Nick Baicoianu at MeanFreePath: http://www.meanfreepath.com */

  dowOffset = typeof (dowOffset) == 'number' ? dowOffset : 0; //default dowOffset to zero
  var newYear = new Date(this.getFullYear(), 0, 1);
  var day = newYear.getDay() - dowOffset; //the day of week the year begins on
  day = (day >= 0 ? day : day + 7);
  var daynum = Math.floor((this.getTime() - newYear.getTime() -
    (this.getTimezoneOffset() - newYear.getTimezoneOffset()) * 60000) / 86400000) + 1;
  var weeknum;
  //if the year starts before the middle of a week
  if (day < 4) {
    weeknum = Math.floor((daynum + day - 1) / 7) + 1;
    if (weeknum > 52) {
      nYear = new Date(this.getFullYear() + 1, 0, 1);
      nday = nYear.getDay() - dowOffset;
      nday = nday >= 0 ? nday : nday + 7;
      /*if the next year starts before the middle of
        the week, it is week #1 of that year*/
      weeknum = nday < 4 ? 1 : 53;
    }
  }
  else {
    weeknum = Math.floor((daynum + day - 1) / 7);
  }
  return weeknum;
};
class CalendarGraph {
  // calgraph-1
  // calgraph-2
  // calgraph-3
  // calgraph-4
  // calgraph-5
  constructor(options) {
    this.ns = 'http://www.w3.org/2000/svg'
    this.size = options.size || 9.7
    this.target = options.target || 1000;
    this.data = options.data || {};
    this.padding = options.padding || 2;
    this.rounding = options.rounding || 2;
    this.terms = options.terms || 'words';
    this.breakpoints = options.breakpoints || [0.6, 1.2]
    this.css_class = options.css_class || 'calgraph'
    this.year = options.year || new Date().getFullYear();
    this.total = 0;

    this.offset = [25, 20]; // Y & X offsets
    this.fullsize = this.size + this.padding;
    this.svgsize = [
      this.fullsize * 53 + (this.offset[0] * 2),
      this.fullsize * 11
    ]
  }
  createCell(x, y) {
    const cell = document.createElementNS(this.ns, 'rect');
    cell.setAttributeNS(null, 'width', this.size);
    cell.setAttributeNS(null, 'height', this.size);
    cell.setAttributeNS(null, 'x', x);
    cell.setAttributeNS(null, 'y', y);
    cell.setAttributeNS(null, 'rx', this.rounding);
    cell.setAttributeNS(null, 'ry', this.rounding);
    cell.setAttributeNS(null, "stroke-width", 1);
    return cell;
  };

  drawAxis() {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    const word_days = ['Tue', 'Thu', 'Sat']
    const axis = document.createElementNS(this.ns, 'g');
    for (var i = 0; i < months.length; i++) {
      var newText = document.createElementNS(this.ns, 'text')
      newText.setAttributeNS(null, "x", ((this.svgsize[0] - this.offset[0]) / 12 * i) + this.size + this.offset[0]);
      newText.setAttributeNS(null, "y", 20);
      newText.setAttributeNS(null, "class", 'calgraph-text')
      var textNode = document.createTextNode(months[i]);
      newText.appendChild(textNode);
      axis.appendChild(newText)
    }
    const y = [4 * this.fullsize, 6 * this.fullsize, 8 * this.fullsize]
    for (var i = 0; i < word_days.length; i++) {
      var newText = document.createElementNS(this.ns, 'text')
      newText.setAttributeNS(null, "x", 10);
      newText.setAttributeNS(null, "y", y[i] - 2);
      newText.setAttributeNS(null, "class", 'calgraph-text')
      var textNode = document.createTextNode(word_days[i]);
      newText.appendChild(textNode);
      axis.appendChild(newText)
    }
    var newText = document.createElementNS(this.ns, 'text')
    newText.setAttribute('id', 'cg-msg')
    newText.setAttribute("x", 10);
    newText.setAttribute('y', this.svgsize[1] - 15)
    newText.setAttribute('class', 'calgraph-text-bold');
    newText.setAttributeNS(null, 'text-anchor', 'start')
    newText.setAttributeNS(null, 'alignment-baseline', 'baseline')
    newText.appendChild(document.createTextNode(''));
    axis.appendChild(newText)
    return axis;
  }
  drawLegend() {
    const legend_y = this.svgsize[1] - 15;
    let legend_x = this.svgsize[0] - 115;
    const legend = document.createElementNS(this.ns, 'g')
    legend.setAttributeNS(null, 'x', legend_x)
    legend.setAttributeNS(null, 'y', legend_y)

    const less = document.createElementNS(this.ns, 'text')
    less.appendChild(document.createTextNode('Less'));
    less.setAttributeNS(null, "x", legend_x - 2)
    less.setAttributeNS(null, 'y', legend_y)
    less.setAttribute('class', 'calgraph-text-bold');
    less.setAttributeNS(null, 'text-anchor', 'middle')
    less.setAttributeNS(null, 'alignment-baseline', 'baseline')
    legend.appendChild(less);

    const cells = [
      'calgraph-1',
      'calgraph-2',
      'calgraph-3',
      'calgraph-4',
      'calgraph-5'
    ]
    let key = null;
    cells.forEach((item) => {
      legend_x += this.fullsize
      key = this.createCell(legend_x, legend_y)
      key.setAttribute('class', item)
      legend.appendChild(key);
    });

    legend_x += this.fullsize
    const moar = document.createElementNS(this.ns, 'text')
    moar.appendChild(document.createTextNode('More'));
    moar.setAttributeNS(null, "x", legend_x)
    moar.setAttributeNS(null, 'y', legend_y)
    moar.setAttribute('class', 'calgraph-text-bold')
    moar.setAttributeNS(null, 'alignment-baseline', 'baseline')
    legend.appendChild(moar);
    return legend;
  }
  drawDay(date, data) {
    var day_of_week = (date.getDay() || 7) - 1; // Moves Sunday to bottom; week start Monday
    var week = date.getWeek(1) + 1
    var y = day_of_week * this.fullsize + this.offset[0]
    var x = week * this.fullsize + this.offset[1]
    var value = (data != undefined) ? data['words'] : 0;
    var title = (data != undefined) ? data['title'] : "";

    var css_class; var level;
    switch (true) {
      case value > (this.target * Math.max(...this.breakpoints)):
        css_class = 'calgraph-5'
        break;
      case value > this.target:
        css_class = 'calgraph-4'
        break;
      case value > (this.target * Math.min(...this.breakpoints)):
        css_class = 'calgraph-3'
        break;
      case value > 0:
        css_class = 'calgraph-2'
        break;
      default:
        css_class = 'calgraph-1'
    }
    var level = css_class.split('-')[1]

    const day = this.createCell(x, y);
    day.setAttributeNS(null, 'data-date', date.toISOString().split('T')[0]);
    day.setAttributeNS(null, 'data-terms', this.terms);
    day.setAttributeNS(null, 'data-title', title);
    day.setAttributeNS(null, 'data-count', value);
    day.setAttributeNS(null, 'data-level', level);
    day.setAttributeNS(null, "class", `${this.css_class}-${level}` + " calgraph-day");
    return day;
  }
  write_contribution() {
    document.getElementById('contribution').innerHTML = `${this.total.toLocaleString()} words written in ${this.year}`
  }
  render() {
    const div = document.getElementById('heatmap')
    const svg = document.createElementNS(this.ns, 'svg')

    svg.setAttributeNS(null, 'width', this.svgsize[0])
    svg.setAttributeNS(null, 'height', this.svgsize[1])
    svg.setAttributeNS(null, 'id', 'calgraph');
    svg.setAttributeNS(null, 'class', 'bg-shade-lighter dark:bg-shade-darker rounded mx-auto');
    svg.setAttributeNS(null, 'overflow', 'hidden')
    svg.setAttributeNS(this.ns, 'viewbox', '0 0 ' + this.svgsize[0] + ' ' + this.svgsize[1] + ' 200')

    const eoy = new Date(this.year, 11, 31);
    const nyd = new Date(this.year, 0, 1);
    for (var d = nyd; d <= eoy; d.setDate(d.getDate() + 1)) {
      let this_day = this.data[d.toISOString().split('T')[0]]
      let value = (this_day !== undefined) ? parseInt(this_day['words']) : 0;
      this.total += value;
      svg.appendChild(this.drawDay(d, this_day))
    }

    svg.appendChild(this.drawAxis())
    svg.appendChild(this.drawLegend())
    div.replaceChild(svg, div.firstElementChild)
    document.querySelectorAll('.calgraph-day').forEach(function (day) {
      if (day.dataset.count > 0) {
        day.addEventListener('mouseover', cgCreateTip);
        day.addEventListener('mouseout', cgCancelTip);
      }
    });
  }
}
function cgCreateTip(ev) {
  var title = (this.dataset.title === undefined) ? "" : this.dataset.title
  document.getElementById("cg-msg").innerHTML = `${this.dataset.date}: ${this.dataset.count} ${this.dataset.terms} ${title}`
}
function cgCancelTip(ev) {
  document.getElementById("cg-msg").innerHTML = ''
}
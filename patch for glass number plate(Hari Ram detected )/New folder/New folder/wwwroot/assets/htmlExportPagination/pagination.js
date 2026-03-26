
{{data}}
{{cols}}
currentPage = 1;
pageSize = 20;
function createTableRow(tableData) {
  var table = document.querySelector('table');
  var tableBody = document.querySelector('tbody');
  if (pageSize == 0)
    pageSize = 20;
  var selectedarray = paginate(data, pageSize, currentPage);
  if (selectedarray.length > 0) {
    var tds = document.querySelectorAll("tbody td");
    tds.forEach(function (td) {
      td.remove();
    });
  }
  else
    currentPage -= 1;
  selectedarray.forEach(function (rowData) {
    var row = document.createElement('tr');
    document.querySelector("thead tr").classList.add("danger");
    document.querySelector("thead tr").classList.add("header");
    rowData.forEach(function (cellData) {
      var cell = document.createElement('td');
      if (cellData.includes("jpg")) {
        var img = document.createElement('img');
        img.src =
          `${cellData}`;
        cell.appendChild(img);
      }
      else {
        cell.appendChild(document.createTextNode(cellData));
      }
      row.appendChild(cell);
    });

    tableBody.appendChild(row);
  });
  if (selectedarray.length > 0) {
    table.appendChild(tableBody);
    document.body.appendChild(table);
  }
  
}

function pageChange(page) {
  if (page == 'next') {
    currentPage += 1;
    createTableRow(data)
  }
  else {
    if (currentPage != 1) {
      currentPage -= 1;
      createTableRow(data)
    }
  }
}
function rowChanged(value) {
  if (Number(value) > 1000) {
    window.alert(`row count cannot be greater than 1000`);
    return
  }
  if (Number(value) <= data.length) {
    pageSize = Number(value);
    createTableRow(data);
  }
  else {
    window.alert(`row count cannot be greater than ${data.length}`);
  }
}

function showTotalCount() {
  var count = document.getElementById("totalCount");
  var text = document.createTextNode(`Total Events: ${data.length}`);
  count.appendChild(text);
}


function showFirstPage() {
  currentPage = 1;
  createTableRow(data);
}
function showLastPage() {

  currentPage = Math.ceil(data.length / pageSize);
  createTableRow(data);
}

function paginate(array, page_size, page_number) {
  return array.slice((page_number - 1) * page_size, page_number * page_size);
}

function createTableCol(tableData) {
  var table = document.querySelector('table');
  var tableBody = document.querySelector('thead');
  var row = document.createElement('tr');
  tableData.forEach(function (rowData) {
    var cell = document.createElement('th');
    cell.appendChild(document.createTextNode(rowData));
    row.appendChild(cell);
  });
  tableBody.appendChild(row);
  table.appendChild(tableBody);
  document.body.appendChild(table);
}

showTotalCount();
createTableCol(cols);
createTableRow(data);

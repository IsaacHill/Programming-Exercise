require './sort.rb';

describe NameSorter do
  it 'file_to_array' do
    name_sort = NameSorter.new
    list = name_sort.open_file('./tests/testFile/testFile.txt');
    expect(list).to eq ["BAKER, THEODORE\n", "SMITH, ANDREW\n", "KENT, MADISON\n", "SMITH, FREDRICK"]
  end
  it 'sort_names' do
    name_sort = NameSorter.new
    list = name_sort.sort_names(["BAKER, THEODORE\n", "SMITH, ANDREW\n", "KENT, MADISON\n", "SMITH, FREDRICK"]);
    expect(list).to eq ["BAKER, THEODORE\n", "KENT, MADISON\n", "SMITH, ANDREW\n", "SMITH, FREDRICK"]
  end
  it 'save_file correctly' do
    name_sort = NameSorter.new
    name_sort.save_file(["BAKER, THEODORE\n", "KENT, MADISON\n", "SMITH, ANDREW\n", "SMITH, FREDRICK"],'testOutput.txt');
    expect(File.open("testOutput.txt", "rb").read).to eq 'BAKER, THEODORE
KENT, MADISON
SMITH, ANDREW
SMITH, FREDRICK'
name_sort.save_file(["BAKER, THEODORE\n", "KENT, MADISON\n", "SMITH, ANDREW\n", "SMITH, FREDRICK"],'testOutput.txt');
    expect(File.open("testOutput.txt", "rb").read).to eq 'BAKER, THEODORE
KENT, MADISON
SMITH, ANDREW
SMITH, FREDRICK'
  File.delete("testOutput.txt")
end

end
# MLcomp: website for automatic and standarized execution of algorithms on datasets.
# Copyright (C) 2010 by Percy Liang and Jake Abernethy
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'mlcomp/RunInfo'

# Process performing datasets.
class PerformingDatasetProcessorRunInfo < RunInfo
  attr_reader :dataset, :inspector

  def initialize(dataset, inspector)
    @dataset = dataset
    @inspector = inspector
  end

  def getRunSpecObj
    main = Program.findByName('performing-processor', DatasetException)
    spec = RunSpecification.new([main, dataset, inspector])
    spec.verifyTypes(DatasetException)
    spec
  end

  def coreProgram; inspector end
  def coreDataset; dataset end

  def self.sortFieldSpec; FieldSpec.new([]) end
end

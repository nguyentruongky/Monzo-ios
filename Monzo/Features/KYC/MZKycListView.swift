//  Created by Ky Nguyen

import UIKit

struct MZKycListViewModel {
    var key: String
    var title: String
    var isSelected: Bool = false
}

class MZKycListView: KNView {
    private var datasource = [MZKycListViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    lazy var tableView = UITableView(cells: [MZKycListItemCell.self], source: self)
    private var tableViewBottomConstraint: NSLayoutConstraint?
    private var tableViewHeightConstraint: NSLayoutConstraint?
    private let cellHeight: CGFloat = 66
    override func setupView() {
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.lightGray.alpha(0.5)
        tableView.separatorInset = UIEdgeInsets(left: 16)
        tableView.backgroundColor = .secondaryBg
        tableView.setCorner(radius: 5)
        tableView.tableFooterView = UIView()
        
        addSubviews(views: tableView)
        let constraints = tableView.fillSuperView(space: UIEdgeInsets(left: 16, right: 16))
        tableViewBottomConstraint = constraints?.bottom
        tableViewHeightConstraint = tableView.height(0, isActive: false)
    }
    
    func setData(stringArrays: [String]) {
        datasource = stringArrays.map { MZKycListViewModel(key: $0, title: $0)}
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let estimatedHeight = CGFloat(datasource.count) * cellHeight
        if estimatedHeight == tableView.frame.height { return }
        
        if estimatedHeight <= tableView.frame.height {
            tableViewHeightConstraint?.constant = estimatedHeight
            tableViewHeightConstraint?.isActive = true
            tableViewBottomConstraint?.isActive = false
            tableView.isScrollEnabled = false
        } else {
            tableViewHeightConstraint?.isActive = false
            tableViewBottomConstraint?.isActive = true
            tableView.isScrollEnabled = true
        }
    }
}

extension MZKycListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MZKycListItemCell = tableView.dequeue(at: indexPath)
        cell.setData(datasource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MZKycListItemCell
        datasource[indexPath.row].isSelected = !datasource[indexPath.row].isSelected
        cell.isSelected = datasource[indexPath.row].isSelected
    }
}

class MZKycListItemCell: KNTableCell {
    let titleLabel = UILabel(font: .main(size: 15), color: .white)
    let checkIcon = UIImageView(imageName: "check")
    let notCheckIcon = UIView(background: .clear)
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                checkIcon.isHidden = false
                notCheckIcon.isHidden = true
            } else {
                checkIcon.isHidden = true
                notCheckIcon.isHidden = false
            }
        }
    }
    
    override func setupView() {
        backgroundColor = .clear
        
        contentView.addSubviews(views: titleLabel)
        titleLabel.leftToSuperview(space: 16)
        titleLabel.centerYToSuperview()
        
        contentView.addSubviews(views: checkIcon)
        checkIcon.rightToSuperview(space: -16)
        checkIcon.centerYToSuperview()
        checkIcon.square(edge: 24)
        
        notCheckIcon.setCorner(radius: 12)
        notCheckIcon.setBorder(width: 1, color: .color999999)
        contentView.addSubviews(views: notCheckIcon)
        notCheckIcon.fill(toView: checkIcon)
    }
    
    func setData(_ data: MZKycListViewModel) {
        titleLabel.text = data.title
        isSelected = data.isSelected
    }
}

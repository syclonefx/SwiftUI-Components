//
// BentoLayout.swift
// BentoLayout
//
// Created by syclonefx on 9/28/26
// https://syclonefx.com
// https://github.com/syclonefx
//

import SwiftUI

struct BentoLayout: Layout {
  var spacing: CGFloat = 8

  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) -> CGSize {
    guard !subviews.isEmpty else {
      return .zero
    }

    let width = proposal.width ?? 370

    let height: CGFloat

    switch subviews.count {
      case 1:
        height = width

      case 2...:
        height = (width - spacing) / 2

      default:
        height = 0
    }

    return CGSize(width: width, height: height)
  }

  func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) {
    guard !subviews.isEmpty else {
      return
    }

    let width = bounds.width
    let height = bounds.height

    switch subviews.count {
      case 1:
        place(
          subviews[0],
          in: bounds
        )

      case 2:
        let itemWidth = (width - spacing) / 2

        place(
          subviews[0],
          in: CGRect(
            x: bounds.minX,
            y: bounds.minY,
            width: itemWidth,
            height: height
          )
        )

        place(
          subviews[1],
          in: CGRect(
            x: bounds.minX + itemWidth + spacing,
            y: bounds.minY,
            width: itemWidth,
            height: height
          )
        )

      case 3:
        placeThree(
          in: bounds,
          subviews: subviews
        )

      case 4:
        placeFour(
          in: bounds,
          subviews: subviews
        )

      default:
        placeFive(
          in: bounds,
          subviews: subviews
        )
    }
  }

  private func placeThree(
    in bounds: CGRect,
    subviews: Subviews
  ) {
    let columnWidth = (bounds.width - spacing) / 2
    let rowHeight = (bounds.height - spacing) / 2

    place(
      subviews[0],
      in: CGRect(
        x: bounds.minX,
        y: bounds.minY,
        width: columnWidth,
        height: bounds.height
      )
    )

    place(
      subviews[1],
      in: CGRect(
        x: bounds.minX + columnWidth + spacing,
        y: bounds.minY,
        width: columnWidth,
        height: rowHeight
      )
    )

    place(
      subviews[2],
      in: CGRect(
        x: bounds.minX + columnWidth + spacing,
        y: bounds.minY + rowHeight + spacing,
        width: columnWidth,
        height: rowHeight
      )
    )
  }

  private func placeFour(
    in bounds: CGRect,
    subviews: Subviews
  ) {
    let columnWidth = (bounds.width - spacing) / 2
    let rowHeight = (bounds.height - spacing) / 2
    let smallWidth = (columnWidth - spacing) / 2

    let rightX = bounds.minX + columnWidth + spacing

    place(
      subviews[0],
      in: CGRect(
        x: bounds.minX,
        y: bounds.minY,
        width: columnWidth,
        height: bounds.height
      )
    )

    place(
      subviews[1],
      in: CGRect(
        x: rightX,
        y: bounds.minY,
        width: columnWidth,
        height: rowHeight
      )
    )

    place(
      subviews[2],
      in: CGRect(
        x: rightX,
        y: bounds.minY + rowHeight + spacing,
        width: smallWidth,
        height: rowHeight
      )
    )

    place(
      subviews[3],
      in: CGRect(
        x: rightX + smallWidth + spacing,
        y: bounds.minY + rowHeight + spacing,
        width: smallWidth,
        height: rowHeight
      )
    )
  }

  private func placeFive(
    in bounds: CGRect,
    subviews: Subviews
  ) {
    let columnWidth = (bounds.width - spacing) / 2
    let smallWidth = (columnWidth - spacing) / 2
    let smallHeight = (bounds.height - spacing) / 2

    let rightX = bounds.minX + columnWidth + spacing

    place(
      subviews[0],
      in: CGRect(
        x: bounds.minX,
        y: bounds.minY,
        width: columnWidth,
        height: bounds.height
      )
    )

    place(
      subviews[1],
      in: CGRect(
        x: rightX,
        y: bounds.minY,
        width: smallWidth,
        height: smallHeight
      )
    )

    place(
      subviews[2],
      in: CGRect(
        x: rightX + smallWidth + spacing,
        y: bounds.minY,
        width: smallWidth,
        height: smallHeight
      )
    )

    place(
      subviews[3],
      in: CGRect(
        x: rightX,
        y: bounds.minY + smallHeight + spacing,
        width: smallWidth,
        height: smallHeight
      )
    )

    place(
      subviews[4],
      in: CGRect(
        x: rightX + smallWidth + spacing,
        y: bounds.minY + smallHeight + spacing,
        width: smallWidth,
        height: smallHeight
      )
    )
  }

  private func place(
    _ subview: LayoutSubview,
    in rect: CGRect
  ) {
    subview.place(
      at: CGPoint(
        x: rect.midX,
        y: rect.midY
      ),
      anchor: .center,
      proposal: ProposedViewSize(
        width: rect.width,
        height: rect.height
      )
    )
  }
}
